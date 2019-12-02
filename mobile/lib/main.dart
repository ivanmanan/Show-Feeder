import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "interface_widget.dart";
import "models/data.dart";

/*
  To Run Application:
  $ flutter emulators --launch Pixel_2_XL
  $ cd /path/to/show_feeder
  $ flutter run
*/

void main() => {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => Data(), // TODO: Pass in username to Data function argument
      child: App(),
    ),
  )
};

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Show Feeder",
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Interface(),
    );
  }
}
