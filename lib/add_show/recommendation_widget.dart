import "package:flutter/material.dart";
import "../styles.dart";
import "../title_detail.dart";
import "../models/title_info.dart";
import "../models/remove_scroll_glow.dart";

class Recommendation extends StatelessWidget {
  final Map titleInfoMap;
  final List<String> anticipatedShows;
  final Set favoritesSet;
  Recommendation(this.titleInfoMap, this.anticipatedShows, this.favoritesSet);

  @override
  Widget build(BuildContext context) {
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
                    "Anticipated Releases",
                    textAlign: TextAlign.center,
                    style: Styles.headerOneText,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              ),
              Container(
                child: Center(
                  child: _buildAnticipatedShows(),
                ),
              ),
            ],
          ),
        ])
      ),
    );
  }

  Widget _buildAnticipatedShows() {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _buildAnticipatedShow(context, anticipatedShows[index]),
      itemCount: anticipatedShows.length,
      physics: ClampingScrollPhysics(), // removes scrolling in nested ListViews
      shrinkWrap: true,
    );
  }

  Widget _buildAnticipatedShow(BuildContext context, String show) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
      child: Card(
        elevation: 1,
        child: ListTile(
          title: Text(show, style: Styles.titleText),
          onTap: () => _tapTitle(context, show),
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }

  void _tapTitle(BuildContext context, String title) {
    if (titleInfoMap.containsKey(title)) {
      TitleInfo info = titleInfoMap[title];
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TitleDetail(info, favoritesSet.contains(title)),
          ));
    }
    // If show title does not exist in hash table - do nothing
  }
}