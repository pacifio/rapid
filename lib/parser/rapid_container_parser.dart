import 'package:flutter/material.dart';
import 'package:rapid/helper/rapid_color_helper.dart';
import 'package:rapid/parser/configurations/rapid_container_configuration.dart';
import 'package:rapid/parser/parser_model.dart';

enum RapidContainerStyleType {
  bgColors,
  borderColors,
  spacing,
  shadows,
  radius,
  borders,
  none,
}

class RapidContainerParser implements ParserModel {
  final String styles;
  final BuildContext context;
  final RapidColorHelper colorHelper = RapidColorHelper();

  Size? size;
  BoxConstraints? boxConstraints;

  BoxDecoration boxDecoration = const BoxDecoration();

  RapidContainerParser({
    required this.styles,
    required this.context,
  });

  @override
  void parse(BuildContext context) {
    final List<String> mappedStyles = styles.split(" ");

    for (var i = 0; i < mappedStyles.length; i++) {
      final String style = mappedStyles[i];
      if (isValidStyle(style)) {
        final RapidContainerStyleType type = determineStyle(style);

        if (type == RapidContainerStyleType.bgColors) {
          boxDecoration = boxDecoration.copyWith(color: parseColor(style));
        } else if (type == RapidContainerStyleType.borderColors) {
          boxDecoration = boxDecoration.copyWith(
            border: borderWithColor(
              parseColor(style),
            ),
          );
        } else if (type == RapidContainerStyleType.spacing) {
        } else if (type == RapidContainerStyleType.shadows) {
        } else if (type == RapidContainerStyleType.radius) {
        } else if (type == RapidContainerStyleType.borders) {
          boxDecoration = boxDecoration.copyWith(
            border: border(style),
          );
        }
      }
    }
  }

  bool isValidStyle(String style) {
    return RapidContainerConfigurations.acceptedStyles.contains(style);
  }

  RapidContainerStyleType determineStyle(String style) {
    if (RapidContainerConfigurations.acceptedBackgroundColors.contains(style)) {
      return RapidContainerStyleType.bgColors;
    } else if (RapidContainerConfigurations.acceptedBorderColors
        .contains(style)) {
      return RapidContainerStyleType.borderColors;
    } else if (RapidContainerConfigurations.acceptedSpacing.contains(style)) {
      return RapidContainerStyleType.spacing;
    } else if (RapidContainerConfigurations.acceptedShadows.contains(style)) {
      return RapidContainerStyleType.shadows;
    } else if (RapidContainerConfigurations.acceptedRadius.contains(style)) {
      return RapidContainerStyleType.radius;
    } else if (RapidContainerConfigurations.acceptedBorders.contains(style)) {
      return RapidContainerStyleType.borders;
    }

    return RapidContainerStyleType.none;
  }

  Color parseColor(String style) {
    final split = style.split("-");
    if (split.length == 2) {
      try {
        final stringColor = split[1];

        if (stringColor == "white") {
          return Colors.white;
        } else if (stringColor == "black") {
          return Colors.black;
        } else if (colorHelper.isValidColor(stringColor)) {
          return colorHelper.fromString(stringColor) ?? Colors.transparent;
        } else if (stringColor == "transparent") {
          return Colors.transparent;
        }
      } on RangeError catch (_) {}
    } else if (split.length == 3) {
      try {
        final stringColor = split[1];
        final colorValue = split[2];

        if (colorHelper.isValidColor(stringColor)) {
          return colorHelper.fromMaterialColor(
            colorHelper.fromString(stringColor),
            colorValue,
          );
        }
      } on RangeError catch (_) {}
    }

    return Colors.transparent;
  }

  Border? border(String style) {
    final split = style.split("-");
    final prevColorOrDefault =
        boxDecoration.border?.bottom.color ?? Colors.black;

    if (split.length == 1) {
      if (split[0] == "border") {
        return Border.all(
          width: 1,
          color: prevColorOrDefault,
        );
      }
    } else if (split.length == 2) {
      try {
        final double borderSize = double.tryParse(split[1]) ?? 0;
        return Border.all(
          width: borderSize,
          color: prevColorOrDefault,
        );
      } on RangeError catch (_) {}
    }

    return null;
  }

  Border borderWithColor(Color borderColor) {
    return Border.all(
        width: boxDecoration.border?.bottom.width ?? 1.0, color: borderColor);
  }

  void updateBoxConstraints(BoxConstraints constraints) {
    boxConstraints = constraints;
    updateSize(constraints.maxWidth, constraints.maxHeight);
  }

  void updateSize(double width, double height) {
    size = Size(width, height);
  }
}
