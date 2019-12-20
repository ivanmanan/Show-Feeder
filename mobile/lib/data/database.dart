import 'package:http/http.dart';

import "../models/title_info.dart";
import "dart:collection";
import "dart:convert";

// TODO: ifconfig | grep 192
const SERVER = "http://192.168.1.117:3000/";

class Database extends TitleInfo {

  static final List<String> mockShows = [
    "Rick and Morty",
  ];

  static GetShows(String type) async {
    String url = SERVER + "get/" + type;
    Response response = await get(url);

    var data = response.body;
    if(response.statusCode == 200) {
      List<String> shows = (jsonDecode(data) as List<dynamic>).cast<String>();
      return shows;
    }
    else {
      return [];
    }
  }

  static Future<dynamic> fetchFavoriteShows() {
    return GetShows("favorites");
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
