import 'package:flutter/material.dart';

class RapidFlowJustifyParser {
  MainAxisAlignment fromString(String justify) {
    if (justify == "justify-center") {
      return MainAxisAlignment.center;
    } else if (justify == "justify-start") {
      return MainAxisAlignment.start;
    } else if (justify == "justify-end") {
      return MainAxisAlignment.end;
    } else if (justify == "justify-between") {
      return MainAxisAlignment.spaceBetween;
    } else if (justify == "justify-around") {
      return MainAxisAlignment.spaceAround;
    } else if (justify == "justify-evenly") {
      return MainAxisAlignment.spaceEvenly;
    }
    return MainAxisAlignment.start;
  }
}

class RapidFlowItemsParser {
  CrossAxisAlignment fromString(String items) {
    if (items == "items-start") {
      return CrossAxisAlignment.start;
    } else if (items == "items-end") {
      return CrossAxisAlignment.end;
    } else if (items == "items-center") {
      return CrossAxisAlignment.center;
    } else if (items == "items-baseline") {
      return CrossAxisAlignment.baseline;
    } else if (items == "items-stretch") {
      return CrossAxisAlignment.stretch;
    }
    return CrossAxisAlignment.start;
  }
}

class RapidFlowConfiguration {
  static const List<String> acceptedFLowTypes = [
    "row",
    "column",
  ];

  static const List<String> acceptedJustify = [
    "justify-center",
    "justify-start",
    "justify-end",
    "justify-between",
    "justify-around",
    "justify-evenly",
  ];

  static const List<String> acceptedItems = [
    "items-start",
    "items-end",
    "items-center",
    "items-baseline",
    "items-stretch",
  ];

  static final List<String> acceptedStyles =
      RapidFlowConfiguration.acceptedFLowTypes +
          RapidFlowConfiguration.acceptedJustify +
          RapidFlowConfiguration.acceptedItems;
}
