import "package:flutter/material.dart";
import "dart:collection";

//import "../data/database.dart";
import "../data/mock_data.dart";
import "title_info.dart";

const List<String> allMonths = ["January", "February", "March", "April",
  "May", "June", "July", "August", "September", "October", "November", "December"];

class Data with ChangeNotifier {

  // TODO: Add constructor with username

  static final SplayTreeMap _yearMonthsMap = MockData.fetchYearMonthsMap();
  static final Map _monthYearFavoritesMap = MockData.fetchMonthYearFavoritesMap();
  static final Map _titleInfoMap = MockData.fetchTitleInfoMap();
  static final Set _favoritesSet = MockData.fetchFavoritesSet();
  static final List<String> _anticipatedShows = MockData.fetchAnticipatedShows();


  // Retrieve data from firestore, then make them into correct data structures here
  SplayTreeMap fetchYearMonthsMap() {
    return _yearMonthsMap;
  }

  Map fetchTitleInfoMap() {
    return _titleInfoMap;
  }

  Map fetchMonthYearFavoritesMap() {
    return _monthYearFavoritesMap;
  }

  Set fetchFavoriteShows() {
    return _favoritesSet;
  }

  List<String> fetchAnticipatedShows() {
    return _anticipatedShows;
  }

  // TODO: This function must also make MockData queries for the back-end
  void handleAddFavorite(TitleInfo info) {
    String month = info.month;
    int year = info.year;
    String monthYear = month + "_" + year.toString();
    _favoritesSet.add(info.title);
    
    if(_yearMonthsMap.containsKey(year)) {
      // Check if month exists
      if(!_yearMonthsMap[year].contains(monthYear)) {
        List<String> months = _yearMonthsMap[year];
        months.add(monthYear);
        // Array months is passed by reference
        sortMonths(months, year.toString());
        _yearMonthsMap[year] = months;
        _monthYearFavoritesMap[monthYear] = [info.title];
      } // month exists, so add show to the months list
      else {
        List<String> shows = _monthYearFavoritesMap[monthYear];
        shows.add(info.title);
        // Sort shows by release days
        shows.sort((a,b) => _titleInfoMap[a].day.compareTo(_titleInfoMap[b].day));
        _monthYearFavoritesMap[monthYear] = shows;
      }
    }
    else { // Insert year and month year
      _yearMonthsMap[year] = [monthYear];
      // Splay Tree Map sorts keys in ascending order
      _monthYearFavoritesMap[monthYear] = [info.title];
    }
    notifyListeners();
  }

  void sortMonths(List<String> months, String year) {
    List<String> sortingOrder = [];
    // Assume last 5 characters of each string is "_year"
    allMonths.forEach((month) => {sortingOrder.add(month + "_" + year)});
    months.sort((a, b) => sortingOrder.indexOf(a).compareTo(sortingOrder.indexOf(b)));
  }

  // TODO: This function must also make MockData queries for the back-end
  void handleRemoveFavorite(TitleInfo info) {
    String month = info.month;
    int year = info.year;
    String monthYear = month + "_" + year.toString();

    // Remove show from Favorites list
    _favoritesSet.remove(info.title);

    // Remove show from monthYearFavorites map
    List<String> favoriteShows = _monthYearFavoritesMap[monthYear];
    if(favoriteShows.length == 1) {
      _monthYearFavoritesMap.remove(monthYear);

      // Also remove month from the Year map
      List<String> months = _yearMonthsMap[year];
      if(months.length == 1) {
        _yearMonthsMap.remove(year);
      }
      else {
        months.remove(monthYear);
        _yearMonthsMap[year] = months;
      }
    }
    else { // Otherwise, another show is released in the same month
      favoriteShows.remove(info.title);
      _monthYearFavoritesMap[monthYear] = favoriteShows;
    }
    notifyListeners();
  }
}