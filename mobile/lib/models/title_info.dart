import "package:flutter/material.dart";

@immutable
class TitleInfo {
  TitleInfo({this.title, this.day, this.month, this.year});

  final String title;
  final int day;
  final String month;
  final int year;
}