import 'package:flutter/material.dart';

enum RapidPrefixType {
  mobile,
  tab,
  laptop,
  desktop,
  unknown,
}

class RapidPrefixHelper {
  RapidPrefixType prefixTypeFromString(String prefix) {
    switch (prefix) {
      case "mobile":
        return RapidPrefixType.mobile;
      case "tab":
        return RapidPrefixType.tab;
      case "laptop":
        return RapidPrefixType.laptop;
      case "desktop":
        return RapidPrefixType.desktop;
      default:
        return RapidPrefixType.unknown;
    }
  }

  bool isResponsivePrefix(RapidPrefixType prefixType) {
    return prefixType == RapidPrefixType.mobile ||
        prefixType == RapidPrefixType.tab ||
        prefixType == RapidPrefixType.laptop ||
        prefixType == RapidPrefixType.desktop;
  }

  void applyResponsiveStyle({
    required BuildContext context,
    required Function applier,
    required RapidPrefixType prefixType,
  }) {
    final Size deviceSize = MediaQuery.of(context).size;
    if (deviceSize.width < 600 && prefixType == RapidPrefixType.mobile) {
      applier();
    } else if (deviceSize.width > 600 &&
        deviceSize.width < 1280 &&
        prefixType == RapidPrefixType.tab) {
      applier();
    } else if (deviceSize.width > 1200 &&
        deviceSize.width < 1400 &&
        prefixType == RapidPrefixType.laptop) {
      applier();
    } else if (deviceSize.width > 1400 &&
        prefixType == RapidPrefixType.desktop) {
      applier();
    }
  }
}
