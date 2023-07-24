import 'package:flutter/material.dart';
import 'package:rapid/helper/rapid_color_helper.dart';
import 'package:rapid/helper/rapid_prefix_helper.dart';
import 'package:rapid/parser/configurations/rapid_prefix.dart';
import 'package:rapid/parser/configurations/rapid_text_configuration.dart';
import 'package:rapid/parser/parser_model.dart';

enum RapidTextStyleType {
  textColor,
  fontWeight,
  decoration,
  textSize,
  textAlignment,
  lineHeight,
  letterSpacing,
  textTransforms,
  none,
}

class RapidTextParser implements ParserModel {
  final String styles;
  final BuildContext context;
  final RapidColorHelper colorHelper = RapidColorHelper();
  final RapidPrefixHelper prefixHelper = RapidPrefixHelper();
  final RapidTextSizeMetrics textSizeMetrics = RapidTextSizeMetrics();
  final RapidFontWeightMetrics fontWeightMetrics = RapidFontWeightMetrics();
  final RapidLineHeightSpacingMetrics lineHeightSpacingMetrics =
      RapidLineHeightSpacingMetrics();
  final RapidLetterSpacingMetrics letterSpacingMetrics =
      RapidLetterSpacingMetrics();

  TextStyle textStyle = const TextStyle();
  TextAlign textAlign = TextAlign.left;

  String text;
  late String modiefiedText;

  RapidTextParser({
    required this.styles,
    required this.context,
    required this.text,
  }) {
    modiefiedText = text;
  }

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
      final RapidTextStyleType type = determineStyle(style);

      if (type == RapidTextStyleType.textSize) {
        _applyPrefix(
          style,
          prefix,
          () => _applyTextSize(style),
        );
      } else if (type == RapidTextStyleType.textColor) {
        _applyPrefix(
          style,
          prefix,
          () => textStyle = textStyle.copyWith(
            color: parseColor(style),
          ),
        );
      } else if (type == RapidTextStyleType.fontWeight) {
        _applyPrefix(
          style,
          prefix,
          () => _applyFontWeight(style),
        );
      } else if (type == RapidTextStyleType.decoration) {
        _applyPrefix(
          style,
          prefix,
          () => _applyTextDecoration(style),
        );
      } else if (type == RapidTextStyleType.textAlignment) {
        _applyPrefix(
          style,
          prefix,
          () => _applyTextAlignment(style),
        );
      } else if (type == RapidTextStyleType.lineHeight) {
        _applyPrefix(
          style,
          prefix,
          () => _applyLineHeight(style),
        );
      } else if (type == RapidTextStyleType.letterSpacing) {
        _applyPrefix(
          style,
          prefix,
          () => _applyLetterSpacing(style),
        );
      } else if (type == RapidTextStyleType.textTransforms) {
        _applyPrefix(
          style,
          prefix,
          () => _applyTextTransforms(style),
        );
      }
    }
  }

  void _applyTextSize(String style) {
    try {
      final metric = style.split("-")[1];
      textStyle = textStyle.copyWith(
        fontSize: textSizeMetrics.fromString(metric),
      );
    } on RangeError catch (_) {
      return;
    }
  }

  void _applyFontWeight(String style) {
    try {
      final metric = style.split("-")[1];
      textStyle = textStyle.copyWith(
        fontWeight: fontWeightMetrics.fromString(metric),
      );
    } on RangeError catch (_) {
      return;
    }
  }

  void _applyTextDecoration(String style) {
    if (style == "underline") {
      textStyle = textStyle.copyWith(decoration: TextDecoration.underline);
    } else if (style == "line-through") {
      textStyle = textStyle.copyWith(decoration: TextDecoration.lineThrough);
    }
  }

  void _applyTextAlignment(String style) {
    if (style == "text-left") {
      textAlign = TextAlign.left;
    } else if (style == "text-right") {
      textAlign = TextAlign.right;
    } else if (style == "text-center") {
      textAlign = TextAlign.center;
    } else if (style == "text-start") {
      textAlign = TextAlign.start;
    } else if (style == "text-end") {
      textAlign = TextAlign.end;
    } else if (style == "text-justify") {
      textAlign = TextAlign.justify;
    }
  }

  void _applyTextTransforms(String style) {
    if (style == "uppercase") {
      modiefiedText = text.toUpperCase();
    } else if (style == "lowercase") {
      modiefiedText = text.toLowerCase();
    } else if (style == "capitalize") {
      modiefiedText = text[0].toUpperCase() + text.substring(1).toLowerCase();
    } else if (style == "normal-case") {
      modiefiedText = text;
    }
  }

  void _applyLetterSpacing(String style) {
    try {
      final size = style.split("-")[1];
      textStyle = textStyle.copyWith(
        letterSpacing: letterSpacingMetrics.fromString(size),
      );
    } on RangeError catch (_) {
      return;
    }
  }

  void _applyLineHeight(String style) {
    try {
      final size = style.split("-")[1];
      textStyle = textStyle.copyWith(
        height: lineHeightSpacingMetrics.fromString(size),
      );
    } on RangeError catch (_) {
      return;
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
    return RapidTextConfigurations.acceptedStyles.contains(style);
  }

  RapidTextStyleType determineStyle(String style) {
    if (RapidTextConfigurations.acceptedTextSizes.contains(style)) {
      return RapidTextStyleType.textSize;
    } else if (RapidTextConfigurations.acceptedTextDecorations
        .contains(style)) {
      return RapidTextStyleType.decoration;
    } else if (RapidTextConfigurations.acceptedTextColors.contains(style)) {
      return RapidTextStyleType.textColor;
    } else if (RapidTextConfigurations.acceptedFontWeights.contains(style)) {
      return RapidTextStyleType.fontWeight;
    } else if (RapidTextConfigurations.acceptedTextAlignments.contains(style)) {
      return RapidTextStyleType.textAlignment;
    } else if (RapidTextConfigurations.acceptedLineHeight.contains(style)) {
      return RapidTextStyleType.lineHeight;
    } else if (RapidTextConfigurations.acceptedLetterSpacing.contains(style)) {
      return RapidTextStyleType.letterSpacing;
    } else if (RapidTextConfigurations.acceptedTextTransforms.contains(style)) {
      return RapidTextStyleType.textTransforms;
    }

    return RapidTextStyleType.none;
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
}
