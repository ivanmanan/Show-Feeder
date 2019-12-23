import "../models/title_info.dart";
import "dart:collection";

/*
  This data mocks a user's favorite shows list
*/

class MockData extends TitleInfo {

  static final List<String> favoriteShows = [
    "Bojack Horseman",
    "Rick and Morty",
    "South Park",
    "American Dad",
    "Big Mouth",
    "Love, Death, and Robots",
    "The Simpsons",
    "Futurama",
    "Family Guy",
    "Game of Thrones",
    "Breaking Bad",
    "X-Files",
    "The Mandalorian",
    "Purgatony",
    "How to Sell Drugs Online (Fast)",
    "The Haunting of Hill House",
    "The Society",
    "Sex Education",
    "American Vandal",
    "House of Cards",
    "The Chilling Adventures of Sabrina"
  ];

  static final SplayTreeMap yearMonths = SplayTreeMap.from({
    2020: ["January_2020", "February_2020", "March_2020", "April_2020", "May_2020", "June_2020", "July_2020", "November_2020"],
    2021: ["May_2021", "June_2021", "November_2021", "December_2021"]
  });

  static final monthYearFavorites = {
    "January_2020": ["Bojack Horseman - Season 6", "The Chilling Adventures of Sabrina - Season 2", "Sex Education - Season 2"],
    "February_2020": ["Better Call Saul - Season 5"],
    "March_2020": ["A Quiet Place: Part II", "Mulan"],
    "April_2020": ["The New Mutants"],
    "May_2020": ["Black Widow"],
    "June_2020": ["Wonder Woman 1984"],
    "July_2020": ["Bob's Burgers:The Movie"],
    "November_2020": ["The Eternals"],
    "May_2021": ["Doctor Strange in the Multiverse of Madness"],
    "June_2021": ["The Batman"],
    "November_2021": ["Thor: Love and Thunder"],
    "December_2021": ["Avatar 2"]

  };

  static final titleInfo = {
    "The Bojack Horseman Show - Season 6": TitleInfo(title: "The Bojack Horseman Show - Season 6", day: 31, month: "January", year: 2020),
    "The Chilling Adventures of Sabrina - Season 2": TitleInfo(title: "The Chilling Adventures of Sabrina - Season 2", day: 24, month: "January", year: 2020),
    "Sex Education - Season 2": TitleInfo(title: "Sex Education - Season 2", day: 17, month: "January", year: 2020),
    "Better Call Saul - Season 5": TitleInfo(title: "Better Call Saul - Season 5", day: 24, month: "February", year: 2020),
    "A Quiet Place: Part II": TitleInfo(title: "A Quiet Place: Part II", day: 20, month: "March", year: 2020),
    "Mulan": TitleInfo(title: "Mulan", day: 27, month: "March", year: 2020),
    "The New Mutants": TitleInfo(title: "The New Mutants", day: 3, month: "April", year: 2020),
    "Black Widow": TitleInfo(title: "Black Widow", day: 1, month: "May", year: 2020),
    "Wonder Woman 1984": TitleInfo(title: "Wonder Woman 1984", day: 5, month: "June", year: 2020),
    "Bob's Burgers:The Movie": TitleInfo(title: "Bob's Burgers:The Movie", day: 17, month: "July", year: 2020),
    "The Eternals": TitleInfo(title: "The Eternals", day: 6, month: "November", year: 2020),
    "Doctor Strange in the Multiverse of Madness": TitleInfo(title: "Doctor Strange in the Multiverse of Madness", day: 7, month: "May", year: 2021),
    "The Batman": TitleInfo(title: "The Batman", day: 25, month: "June", year: 2021),
    "Thor: Love and Thunder": TitleInfo(title: "Thor: Love and Thunder", day: 5, month: "November", year: 2021),
    "Avatar 2": TitleInfo(title: "Avatar 2", day: 17, month: "December", year: 2021),
  };

  static List<String> fetchFavoriteShows() {
    return MockData.favoriteShows;
  }

  static SplayTreeMap fetchYearMonthsMap() {
    return MockData.yearMonths;
  }

  static Map fetchMonthYearFavoritesMap() {
    return MockData.monthYearFavorites;
  }

  static Map fetchTitleInfoMap() {
    return MockData.titleInfo;
  }
}
