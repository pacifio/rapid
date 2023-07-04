import 'package:flutter/material.dart';

class RapidColorHelper {
  static const List<String> validColor = [
    "amber",
    "blue",
    "bluegrey",
    "brown",
    "cyan",
    "deeporange",
    "deeppurple",
    "green",
    "grey",
    "indigo",
    "lightblue",
    "lightgreen",
    "lime",
    "orange",
    "pink",
    "purple",
    "red",
    "teal",
    "yellow",
  ];

  bool isValidColor(String stringColor) {
    return RapidColorHelper.validColor.contains(stringColor);
  }

  Color fromMaterialColor(MaterialColor? materialColor, String range) {
    if (materialColor != null) {
      if (range == "50") {
        return materialColor.shade50;
      } else if (range == "100") {
        return materialColor.shade100;
      } else if (range == "200") {
        return materialColor.shade200;
      } else if (range == "300") {
        return materialColor.shade300;
      } else if (range == "400") {
        return materialColor.shade400;
      } else if (range == "500") {
        return materialColor.shade500;
      } else if (range == "600") {
        return materialColor.shade600;
      } else if (range == "700") {
        return materialColor.shade700;
      } else if (range == "800") {
        return materialColor.shade800;
      } else if (range == "900") {
        return materialColor.shade900;
      }
    }

    return Colors.transparent;
  }

  MaterialColor? fromString(String stringColor) {
    if (stringColor == "amber") {
      return Colors.amber;
    } else if (stringColor == "blue") {
      return Colors.blue;
    } else if (stringColor == "bluegrey") {
      return Colors.blueGrey;
    } else if (stringColor == "brown") {
      return Colors.brown;
    } else if (stringColor == "cyan") {
      return Colors.cyan;
    } else if (stringColor == "deeporange") {
      return Colors.deepOrange;
    } else if (stringColor == "deeppurple") {
      return Colors.deepPurple;
    } else if (stringColor == "green") {
      return Colors.green;
    } else if (stringColor == "grey") {
      return Colors.grey;
    } else if (stringColor == "indigo") {
      return Colors.indigo;
    } else if (stringColor == "lightblue") {
      return Colors.lightBlue;
    } else if (stringColor == "lightgreen") {
      return Colors.lightGreen;
    } else if (stringColor == "lime") {
      return Colors.lime;
    } else if (stringColor == "orange") {
      return Colors.orange;
    } else if (stringColor == "pink") {
      return Colors.pink;
    } else if (stringColor == "purple") {
      return Colors.purple;
    } else if (stringColor == "red") {
      return Colors.red;
    } else if (stringColor == "teal") {
      return Colors.teal;
    } else if (stringColor == "yellow") {
      return Colors.yellow;
    }

    return null;
  }
}
