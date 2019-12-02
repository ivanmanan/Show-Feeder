import "package:flutter/material.dart";
import "../title_detail.dart";
import "../models/title_info.dart";

class SearchBar extends StatelessWidget implements PreferredSizeWidget {

  final Set favoritesSet;
  final Map allShowsMap;
  SearchBar(this.favoritesSet, this.allShowsMap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AppBar(
        title: Text("Search Show..."),
        backgroundColor: Colors.lightBlue[300],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ShowSearch(favoritesSet, allShowsMap, allShowsMap.keys.toList(), favoritesSet.toList()),
              );
            },
          ),
        ],
      ),
      onTap: () {
        showSearch(
          context: context,
          delegate: ShowSearch(favoritesSet, allShowsMap, allShowsMap.keys.toList(), favoritesSet.toList()),
        );
      },
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class ShowSearch extends SearchDelegate<String> {
  
  final Set favoritesSet;
  final Map allShowsMap;
  final List<String> shows;
  final List<String> recentShows;
  ShowSearch(this.favoritesSet, this.allShowsMap, this.shows, this.recentShows);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show results when user submits search query
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show search suggestions
    recentShows.sort();
    final suggestionList = query.isEmpty 
          ? recentShows // Below is necesary for case insensitivity
          : shows.where((p) => p.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
        onTap: () => _tapTitle(context, suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }

  void _tapTitle(BuildContext context, String title) {
    recentShows.add(title);
    if(allShowsMap.containsKey(title)) {
      TitleInfo info = allShowsMap[title];
        Navigator.push(context, MaterialPageRoute(
        builder: (context) => TitleDetail(info, favoritesSet.contains(title)),
      ));
    }
    // If show title does not exist in hash table - do nothing
  }
}