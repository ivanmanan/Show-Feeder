# Show Feeder

## About
Show Feeder is an application that displays the release dates for your favorite TV show seasons and anticipated movies. 

The **Home** page consists of a list of your favorite shows sorted by date. Clicking on a show reveals its Rotten Tomatoes or Metacritic ratings for previous seasons and/or relevant shows as well as the distribution of the show (e.g. Netflix, HBO).

This application also has a **search** page that displays highly anticipated shows and synopsis preview. The searchbar is used to search for specific titles to add onto the Home page. Pressing the heart icon would add the title to the favorites list.

All show favorites lists are saved onto the server.

Notifications are displayed at time of show release.

The future of Show Feeder is for future Google Play Store release.

## Firestore
* User Collection - user id, username, password, user-favorites-list
* Shows Collection - title-info object

## Specs
* Add Shows - setup data for most anticipated shows depending on the month
* Infrastructure - setup the flutter-firestore integration, which may require refactoring some code base in order to work with the StreamBuilder widget, unless can do single queries in the `/data/database.dart` file.
* Infrastructure - create user accounts using Google authentication, have login screen, and have user session saved as a state
* Infrastructure - create a script to retrieve all show titles and releases and save into firestore; a separate script file would update the database; see [this API link](https://developers.themoviedb.org/3/tv/get-popular-tv-shows)
* Infrastructure - place all sensitive content onto the `.gitignore` file
* Infrastructure - ding a notification at show's release date at 9 AM
* Infrastructure - create script that updates firebase database with new shows; it would also remove old shows from both the all shows collection and every user favorites collection