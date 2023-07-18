import 'package:flutter/material.dart';
import 'package:rapid/helper/rapid_prefix_helper.dart';
import 'package:rapid/parser/configurations/rapid_flow_configuration.dart';
import 'package:rapid/parser/configurations/rapid_prefix.dart';
import 'package:rapid/parser/parser_model.dart';

enum RapidFlowMech {
  row,
  column,
}

enum RapidFlowType {
  flow,
  justify,
  items,
  none,
}

class RapidFlowParser implements ParserModel {
  final String styles;
  final BuildContext context;

  final RapidPrefixHelper prefixHelper = RapidPrefixHelper();

  RapidFlowMech mech = RapidFlowMech.column;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;

  final RapidFlowJustifyParser justifyParser = RapidFlowJustifyParser();
  final RapidFlowItemsParser itemsParser = RapidFlowItemsParser();

  RapidFlowParser({
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
      final RapidFlowType type = determineFlow(style);
      if (type == RapidFlowType.flow) {
        _applyPrefix(
          style,
          prefix,
          () {
            if (style == "row") {
              mech = RapidFlowMech.row;
            } else if (style == "column") {
              mech = RapidFlowMech.column;
            }
          },
        );
      } else if (type == RapidFlowType.justify) {
        _applyPrefix(
          style,
          prefix,
          () {
            mainAxisAlignment = justifyParser.fromString(style);
          },
        );
      } else if (type == RapidFlowType.items) {
        _applyPrefix(
          style,
          prefix,
          () {
            crossAxisAlignment = itemsParser.fromString(style);
          },
        );
      }
    }
  }

  Widget render(List<Widget> children) {
    parse(context);

    if (mech == RapidFlowMech.row) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
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
    return RapidFlowConfiguration.acceptedStyles.contains(style);
  }

  RapidFlowType determineFlow(String style) {
    if (RapidFlowConfiguration.acceptedFLowTypes.contains(style)) {
      return RapidFlowType.flow;
    } else if (RapidFlowConfiguration.acceptedJustify.contains(style)) {
      return RapidFlowType.justify;
    } else if (RapidFlowConfiguration.acceptedItems.contains(style)) {
      return RapidFlowType.items;
    }

    return RapidFlowType.none;
  }
}
