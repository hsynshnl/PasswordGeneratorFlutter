import 'package:flutter/material.dart';

class Sabitler {
  static const mainColor = Colors.blueGrey;
  static const EdgeInsets mainPadding = EdgeInsets.all(8.0);
  static const String anaBaslik = "Password Generator";
  static const TextStyle baslikStyle = TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle altBaslikStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle toogleStyle =
      TextStyle(fontSize: 18, color: Colors.white);
  static const Size buttonSize = Size(200, 50);
  static BorderRadius borderRadius = BorderRadius.circular(50);
  static RoundedRectangleBorder borderShape = RoundedRectangleBorder(
    borderRadius: borderRadius,
  );
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    fixedSize: buttonSize,
    primary: Sabitler.mainColor.shade700,
    elevation: 12,
    shape: borderShape,
  );
}
