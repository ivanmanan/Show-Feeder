// import 'package:sync_http/sync_http.dart' as sync_http;
import 'package:http/http.dart';

import "../models/title_info.dart";
import "dart:collection";
import "dart:convert";

// TODO: ifconfig | grep 192
const IP_ADDRESS = "192.168.1.117";

class Database extends TitleInfo {

  static final List<String> mockShows = [
    "Rick and Morty",
  ];

  static GetShows(String type) async {
    String url = "http://" + IP_ADDRESS + ":3000/get/" + type;
    Response response = await get(url);

    var data = response.body;
    if(response.statusCode == 200) {
      return json.decode(data).cast<String>();
    }
    else {
      return [];
    }
  }

  // TODO: Have the GET request working
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
