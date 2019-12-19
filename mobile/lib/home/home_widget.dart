import "package:flutter/material.dart";
import "dart:collection";
import "../models/title_info.dart";
import "../title_detail.dart";
import '../styles.dart';

class Home extends StatelessWidget {

  final Map monthYearFavoritesMap, titleInfoMap;
  final SplayTreeMap yearMonthsMap;
  Home(this.monthYearFavoritesMap, this.yearMonthsMap, this.titleInfoMap);

  @override
  Widget build(BuildContext context) {
    final List<int> yearMonthsKeys = yearMonthsMap.keys.toList().cast<int>();
    // Conditional rendering of home screen
    if(yearMonthsKeys.length == 0) {
      return _buildTutorial(context);
    }
    else {
      return ListView.builder(
        itemBuilder: (buildContext, buildIndex) =>_buildRowsByYears(buildContext, buildIndex, yearMonthsKeys),
        itemCount: yearMonthsKeys.length,
      );
    }
  }

  // NOTE: This list contains rows divided by years
  Widget _buildRowsByYears(BuildContext context, int index, List<int> yearMonthsKeys) {
    final int year = yearMonthsKeys[index];
    final List<String> monthYear = yearMonthsMap[year];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Text(year.toString(), style: Styles.yearText),
          color: Colors.grey[300],
          padding: const EdgeInsets.fromLTRB(30.0, 8.0, 0.0, 8.0),
        ),
        Container(
          decoration: BoxDecoration( //                    <-- BoxDecoration
            border: Border(bottom: BorderSide()),
          ),
        ),
        ListView.builder(
          itemBuilder: (contextYear, indexYear) => _buildRowsByMonths(contextYear, indexYear, monthYear),
          itemCount: monthYear.length,
          physics: ClampingScrollPhysics(), // removes scrolling in nested ListViews
          shrinkWrap: true,
        ),
      ],
    );

    /*
      ShrinkWrap Property:
      https://stackoverflow.com/questions/54007073/what-does-the-shrink-wrap-property-do-in-flutter
    */
  }

  // NOTE: This list contains rows divided by months
  Widget _buildRowsByMonths(BuildContext context, int index, List<String> monthYear) {
    final String month = monthYear[index];
    final String printMonth = month.substring(0, month.length-5);
    final List<String> favoritesOneMonth = monthYearFavoritesMap[month];

    return Column (
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Text(printMonth, style: Styles.monthText),
          color: Colors.lightGreen[100],
          padding: const EdgeInsets.fromLTRB(30.0, 6.0, 0.0, 6.0)
        ),
        ListView.builder(
          itemBuilder: (contextMonthYear, indexMonthYear) => _buildRowsByTitles(contextMonthYear, indexMonthYear, favoritesOneMonth),
          itemCount: favoritesOneMonth.length,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
        ),
      ],
    );
  }

  // NOTE: This list contains rows divided by titles
  Widget _buildRowsByTitles(BuildContext context, int index, List<String> favorites) {
    final favorite = favorites[index];
    return Column(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (contextTitle, indexTitle) => _buildTitleCard(contextTitle, indexTitle, favorite),
          itemCount: 1, // There is only one array of titles to display
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
        ),
      ],
    );
  }

  Widget _buildTitleCard(BuildContext context, int index, String favorite) {
    return Column(
      children: <Widget> [
        Card(
          elevation: 1, // controls the card's box shadow
          child: ListTile(
            title: Text(favorite, style: Styles.titleText),
            contentPadding: EdgeInsets.fromLTRB(24.0, 4.0, 24.0, 4.0),
            onTap: () => _tapTitle(context, favorite),
          ),
        ),
      ]
    );
  }

  void _tapTitle(BuildContext context, String title) {
    TitleInfo info = titleInfoMap[title];
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => TitleDetail(info),
    ));
  }

  Widget _buildTutorial(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Show Feeder displays your upcoming shows and their release dates.",
              style: Styles.regularText,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(
                style: Styles.regularText,
                children: <TextSpan>[
                  TextSpan(
                    text: "You can add a new show using the ",
                  ),
                  TextSpan(
                    text: "Add Show ",
                    style: Styles.regularTextBold,
                  ),
                  TextSpan(
                    text: "tab at the bottom of the screen.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
