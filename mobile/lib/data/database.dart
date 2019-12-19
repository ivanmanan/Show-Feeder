import 'package:http/http.dart';

import "../models/title_info.dart";
import "dart:collection";
import "dart:convert";

class Database extends TitleInfo {

  static final List<String> mockShows = [
    "Rick and Morty",
  ];


  static _makeGetRequest(String type) async {

    String url = "http://10.0.2.2:3000/get/" + type;
    Response response = await get(url);

    if(response.statusCode == 200) {
      // TODO: Return a list
      return [];
      //return response.body;
    }
    else {
      return [];
    }
  }

  static List<String> fetchFavoriteShows() {

    var data = _makeGetRequest("favorites");
    print(data);

    // TODO: Source of error comes from here
    //       Need to figure out how to assure data is a List<String>
    return data;
  }

  static final SplayTreeMap yearMonths = SplayTreeMap.from({
    2019: ["October_2019"],
  });

  static final monthYearFavorites = {
    "October_2019": ["Joker"]
  };

  static final titleInfo = {
    "Joker": TitleInfo(title: "Joker", day: 4, month: "October", year: 2019)
  };

  static SplayTreeMap fetchYearMonthsMap() {
    return Database.yearMonths;
  }

  static Map fetchMonthYearFavoritesMap() {
    return Database.monthYearFavorites;
  }

  static Map fetchTitleInfoMap() {
    return Database.titleInfo;
  }
}
