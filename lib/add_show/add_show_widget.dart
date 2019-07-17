import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "searchbar_widget.dart";
import "recommendation_widget.dart";
import "../models/data.dart";

class AddShow extends StatelessWidget {

  //final Set favoritesSet;
  AddShow();//this.favoritesSet);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) => Scaffold(
        appBar: SearchBar(data.fetchFavoriteShows(), data.fetchTitleInfoMap()),
        body: Recommendation(data.fetchTitleInfoMap(), data.fetchAnticipatedShows(), data.fetchFavoriteShows()),
      ),
    );
  }
}
