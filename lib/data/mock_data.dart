import "../models/title_info.dart";
import "dart:collection";

/*
  This data mocks a user's favorite shows list
*/

class MockData extends TitleInfo {

  static final List<String> anticipatedShows = [
    "The Bojack Horseman Show: Season 6",
    "South Park: Season 24",
    "Joker",
    "Zombieland: Double Tap",
    "The New Mutants",
    "It Chapter Two"
  ];

  static List<String> fetchAnticipatedShows() {
    return MockData.anticipatedShows;
  }

  static final SplayTreeMap yearMonths = SplayTreeMap.from({
    2019: ["June_2019", "September_2019", "October_2019"],
    2020: ["April_2020"]
  });

  static final monthYearFavorites = {
    "June_2019": ["Spider-Man: Far From Home"],
    "October_2019": ["Joker", "Zombieland: Double Tap"],
    "April_2020": ["The New Mutants"],
    "September_2019": ["It Chapter Two", "South Park: Season 24"],
  };

  // NOTE: favorites set must have values in the monthYearFavorites map
  static final favorites = {
    "Spider-Man: Far From Home",
    "Joker", 
    "Zombieland: Double Tap",
    "The New Mutants",
    "It Chapter Two",
    "South Park: Season 24"
  };

  static final titleInfo = {
    "Spider-Man: Far From Home": TitleInfo(title: "Spider-Man: Far From Home", day: 2, month: "June", year: 2019),
    "Joker": TitleInfo(title: "Joker", day: 4, month: "October", year: 2019),
    "Zombieland: Double Tap": TitleInfo(title: "Zombieland: Double Tap", day: 18, month: "October", year: 2019),
    "The New Mutants": TitleInfo(title: "The New Mutants", day: 3, month: "April", year: 2020),
    "The Bojack Horseman Show: Season 6": TitleInfo(title: "The Bojack Horseman Show: Season 6", day: 14, month: "September", year: 2019),
    "South Park: Season 24": TitleInfo(title: "South Park: Season 24", day: 15, month: "September", year: 2019),
    "It Chapter Two": TitleInfo(title: "It Chapter Two", day: 6, month: "September", year: 2019),
  };

  static SplayTreeMap fetchYearMonthsMap() {
    return MockData.yearMonths;
  }

  static Map fetchMonthYearFavoritesMap() {
    return MockData.monthYearFavorites;
  }

  static Set fetchFavoritesSet() {
    return MockData.favorites;
  }

  static Map fetchTitleInfoMap() {
    return MockData.titleInfo;
  }
}
