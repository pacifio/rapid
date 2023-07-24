import 'package:flutter/material.dart';
import 'package:rapid/helper/rapid_color_helper.dart';
import 'package:rapid/helper/rapid_prefix_helper.dart';
import 'package:rapid/parser/configurations/rapid_container_configuration.dart';
import 'package:rapid/parser/configurations/rapid_prefix.dart';
import 'package:rapid/parser/parser_model.dart';

enum RapidContainerStyleType {
  bgColors,
  borderColors,
  spacing,
  shadows,
  radius,
  borders,
  size,
  none,
}

class RapidContainerParser implements ParserModel {
  final String styles;
  final BuildContext context;
  final RapidColorHelper colorHelper = RapidColorHelper();
  final RapidPrefixHelper prefixHelper = RapidPrefixHelper();
  final RapidSpacingMetrics spacingMetrics = RapidSpacingMetrics();

  double? width;
  double? height;

  BoxConstraints? boxConstraints;

  double pt = 0.0;
  double pb = 0.0;
  double pl = 0.0;
  double pr = 0.0;

  double mt = 0.0;
  double mb = 0.0;
  double ml = 0.0;
  double mr = 0.0;

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
      if (hasPrefix(style)) {
        final prefix = style.split(":");
        if (isValidPrefix(prefix[0])) {
          _apply(prefix[1], prefix[0]);
        }
      } else {
        _apply(style);
      }
    }
  }

  void _apply(String style, [String? prefix]) {
    if (isValidStyle(style)) {
      final RapidContainerStyleType type = determineStyle(style);

      if (type == RapidContainerStyleType.bgColors) {
        _applyPrefix(
          style,
          prefix,
          () =>
              boxDecoration = boxDecoration.copyWith(color: parseColor(style)),
        );
      } else if (type == RapidContainerStyleType.borderColors) {
        _applyPrefix(
          style,
          prefix,
          () => boxDecoration = boxDecoration.copyWith(
            border: borderWithColor(
              parseColor(style),
            ),
          ),
        );
      } else if (type == RapidContainerStyleType.spacing) {
        _applyPrefix(style, prefix, () => parseSpacing(style));
      } else if (type == RapidContainerStyleType.size) {
        _applyPrefix(style, prefix, () => parseSize(style));
      } else if (type == RapidContainerStyleType.shadows) {
        _applyPrefix(
          style,
          prefix,
          () => applyShadow(style),
        );
      } else if (type == RapidContainerStyleType.radius) {
        _applyPrefix(
          style,
          prefix,
          () => applyRadius(style),
        );
      } else if (type == RapidContainerStyleType.borders) {
        _applyPrefix(
          style,
          prefix,
          () => boxDecoration = boxDecoration.copyWith(
            border: border(style),
          ),
        );
      }
    }
  }

  void _applyPrefix(String style, String? prefix, Function applier) {
    if (prefix != null) {
      final RapidPrefixType prefixType =
          prefixHelper.prefixTypeFromString(prefix);

      if (prefixHelper.isResponsivePrefix(prefixType)) {
        prefixHelper.applyResponsiveStyle(
          context: context,
          applier: applier,
          prefixType: prefixType,
        );
      }
    } else {
      applier();
    }
  }

  bool hasPrefix(String style) {
    return style.contains(":");
  }

  bool isValidPrefix(String style) {
    return RapidPrefix.acceptedPrefix.contains(style);
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
    } else if (RapidContainerConfigurations.acceptedSizes.contains(style)) {
      return RapidContainerStyleType.size;
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

  void parseSpacing(String style) {
    try {
      final size = style.split("-")[1];
      if (style.startsWith("px")) {
        applyHPadding(size);
      } else if (style.startsWith("py")) {
        applyVPadding(size);
      } else if (style.startsWith("mx")) {
        applyHMargin(size);
      } else if (style.startsWith("my")) {
        applyVMargin(size);
      } else if (style.startsWith("pl")) {
        pl = spacingMetrics.fromString(size);
      } else if (style.startsWith("pr")) {
        pr = spacingMetrics.fromString(size);
      } else if (style.startsWith("pt")) {
        pt = spacingMetrics.fromString(size);
      } else if (style.startsWith("pb")) {
        pb = spacingMetrics.fromString(size);
      } else if (style.startsWith("ml")) {
        ml = spacingMetrics.fromString(size);
      } else if (style.startsWith("mr")) {
        mr = spacingMetrics.fromString(size);
      } else if (style.startsWith("mt")) {
        mt = spacingMetrics.fromString(size);
      } else if (style.startsWith("mb")) {
        mb = spacingMetrics.fromString(size);
      }
    } on RangeError catch (_) {
      return;
    }
  }

  void parseSize(String style) {
    try {
      final size = style.split("-")[1];
      if (style.startsWith("w")) {
        width = spacingMetrics.fromString(size);
      } else if (style.startsWith("h")) {
        height = spacingMetrics.fromString(size);
      }
    } on RangeError catch (_) {
      return;
    }
  }

  void applyHPadding(String size) {
    pr = spacingMetrics.fromString(size);
    pl = spacingMetrics.fromString(size);
  }

  void applyVPadding(String size) {
    pt = spacingMetrics.fromString(size);
    pb = spacingMetrics.fromString(size);
  }

  void applyHMargin(String size) {
    mr = spacingMetrics.fromString(size);
    ml = spacingMetrics.fromString(size);
  }

  void applyVMargin(String size) {
    mt = spacingMetrics.fromString(size);
    mb = spacingMetrics.fromString(size);
  }

  void updateBoxConstraints(BoxConstraints constraints) {
    boxConstraints = constraints;
    updateSize(constraints.maxWidth, constraints.maxHeight);
  }

  void applyShadow(String style) {
    try {
      final metric = style.split("-")[1];
      if (metric == "none") {
        boxDecoration = boxDecoration.copyWith(boxShadow: []);
      } else if (metric == "sm") {
        boxDecoration = boxDecoration.copyWith(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.3),
          ),
        ]);
      } else if (metric == "md") {
        boxDecoration = boxDecoration.copyWith(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -1,
            color: Colors.black.withOpacity(0.6),
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
            color: Colors.black.withOpacity(0.6),
          ),
        ]);
      } else if (metric == "lg") {
        boxDecoration = boxDecoration.copyWith(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
            color: Colors.black.withOpacity(0.6),
          ),
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -3,
              color: Colors.black.withOpacity(0.6))
        ]);
      } else if (metric == "xl") {
        boxDecoration = boxDecoration.copyWith(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 20),
            blurRadius: 25,
            spreadRadius: -5,
            color: Colors.black.withOpacity(0.6),
          ),
          BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 10,
              spreadRadius: -6,
              color: Colors.black.withOpacity(0.6))
        ]);
      } else if (metric == "2xl") {
        boxDecoration = boxDecoration.copyWith(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 25),
            blurRadius: 50,
            spreadRadius: -12,
            color: Colors.black.withOpacity(0.75),
          ),
        ]);
      }
    } on RangeError catch (_) {
      return;
    }
  }

  void applyRadius(String style) {
    try {
      final metric = style.split("-")[1];
      if (metric == "none") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(0.0));
      } else if (metric == "xs") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(1.0));
      } else if (metric == "sm") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(2.0));
      } else if (metric == "md") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(6.0));
      } else if (metric == "lg") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(8.0));
      } else if (metric == "xl") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(12.0));
      } else if (metric == "2xl") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(16.0));
      } else if (metric == "3xl") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(24.0));
      } else if (metric == "full") {
        boxDecoration =
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(9999.0));
      }
    } on RangeError catch (_) {
      return;
    }
  }

  void updateSize(double width, double height) {
    this.width = width;
    this.height = height;
  }
}
