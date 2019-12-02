import "package:cloud_firestore/cloud_firestore.dart";

import "../models/title_info.dart";
import "dart:collection";

class Database extends TitleInfo {

  // Database retrieval is done once here
  // TODO: This must be called from the database
  // TODO: This must be automated such that username is accessible in this file
  /*
  static List<String> anticipatedShows() async {
    List<String> shows;
    await Firestore.instance.collection("shows").snapshots().forEach((snapshot) => {
      shows.add(snapshot.toString())
    });
    return shows;
  }
  */
  static final collection = Firestore.instance.collection("shows").snapshots();

  //static final allShows = collection.getDocuments();

  static final List<String> anticipatedShows = [
    "Joker",
  ];

  static List<String> fetchAnticipatedShows() {
    //return Database.anticipatedShows;
    List<String> shows;
    
    Database.collection.forEach((snapshot) => {
      //shows.add(snapshot.toString())
      print(snapshot.toString())
    });

    //print(Database.collection.toString());
    //print(shows); // TODO: TESTING
    return Database.anticipatedShows;
  }

  static final SplayTreeMap yearMonths = SplayTreeMap.from({
    2019: ["June_2019"],
  });

  static final monthYearFavorites = {
    "June_2019": ["Spider-Man: Far From Home"]
  };

  // NOTE: favorites set must have values in the monthYearFavorites map
  static final favorites = {
    "Spider-Man: Far From Home",
  };

  static final titleInfo = {
    "Spider-Man: Far From Home": TitleInfo(title: "Spider-Man: Far From Home", day: 2, month: "June", year: 2019),
    "Joker": TitleInfo(title: "Joker", day: 4, month: "October", year: 2019),
  };

  static SplayTreeMap fetchYearMonthsMap() {
    return Database.yearMonths;
  }

  static Map fetchMonthYearFavoritesMap() {
    return Database.monthYearFavorites;
  }

  static Set fetchFavoritesSet() {
    return Database.favorites;
  }

  static Map fetchTitleInfoMap() {

    

    return Database.titleInfo;
  }
}
