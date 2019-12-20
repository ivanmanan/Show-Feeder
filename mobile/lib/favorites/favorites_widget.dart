import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../styles.dart";
import "../models/data.dart";
import "../models/remove_scroll_glow.dart";

class Favorites extends StatelessWidget {

  final Future<dynamic> favoriteShows;
  Favorites(this.favoriteShows);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: favoriteShows,
      builder: (context, snapshot) {
        List<String> shows = snapshot.data ?? [];
        shows.sort();
        return Container(
          padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 40.0),
          child: ScrollConfiguration(
            behavior: RemoveScrollGlow(),
            child: ListView(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        "Favorite Shows",
                        textAlign: TextAlign.center,
                        style: Styles.headerOneText,
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  ),
                  Container(
                    child: Center(
                      child: _buildFavoriteShows(shows),
                    ),
                  ),
                ],
              ),
            ])
          ),
        );
      }
    );
  }

    Widget _buildFavoriteShows(shows) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _buildFavoriteShow(context, shows[index]),
      itemCount: shows.length,
      physics: ClampingScrollPhysics(), // removes scrolling in nested ListViews
      shrinkWrap: true,
    );
  }

  Widget _buildFavoriteShow(BuildContext context, String show) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
      child: Card(
        elevation: 1,
        child: ListTile(
          title: Text(show, style: Styles.titleText),
          contentPadding: EdgeInsets.all(10.0),
          onTap: () => _tapTitle(context, show)
        ),
      ),
    );
  }

  void _tapTitle(BuildContext context, String title) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
          padding: EdgeInsets.fromLTRB(50, 150, 50, 50),
          child: ListView(children: <Widget>[
            Container(
              padding: Styles.textPaddingContent,
              child: Text(title, style: Styles.headerOneText),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
              child: _buildButton(context, title)
            )
          ])
        )
      )
    ));
  }

  Widget _buildButton(BuildContext context, String title) {
    return Center(
      child: MaterialButton(
        height: 75.0,
        minWidth: MediaQuery.of(context).size.width * 0.65,
        color: Colors.orange[300],
        child: Text("Remove Favorite", style: Styles.regularTextBold),
        onPressed: () => {
          _removeFavorite(context, title)
        },
        splashColor: Colors.redAccent,
      ),
    );
  }

  void _removeFavorite(BuildContext context, String title) {
    Provider.of<Data>(context, listen: true).handleRemoveShow(title, "favorites");
  }
}

