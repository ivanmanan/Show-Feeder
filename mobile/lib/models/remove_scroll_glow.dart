import "package:flutter/material.dart";

// Removes glow effect during overscroll
class RemoveScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, 
    AxisDirection axisDirection) {
    return child;
  }
}