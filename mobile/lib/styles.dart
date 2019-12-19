import "package:flutter/material.dart";

class Styles {
  static const _headerOneText = 30.0;
  static const _headerTwoText = 28.0;
  static const _yearText = 25.0;
  static const _monthText = 18.0;
  static const _titleText = 18.0;
  static const _regularText = 24.0;

  static final headerOneText = TextStyle(
    fontSize: _headerOneText,
    fontWeight: FontWeight.bold,
  );
  static final headerTwoText = TextStyle(
    fontSize: _headerTwoText,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  static final yearText = TextStyle(
    fontSize: _yearText,
  );
  static final monthText = TextStyle(
    fontSize: _monthText,
  );
  static final titleText = TextStyle(
    fontSize: _titleText,
  );
  static final regularText = TextStyle(
    fontSize: _regularText,
    color: Colors.black87,
  );
  static final regularTextBold = TextStyle(
    fontSize: _regularText,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const pad = 5.0;
  static const padContent = 40.0;
  static const textPaddingHeader = EdgeInsets.all(pad);
  static const textPaddingContent = EdgeInsets.fromLTRB(pad, pad, pad, padContent);
}