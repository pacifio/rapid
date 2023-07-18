import 'package:flutter/material.dart';
import 'package:rapid/parser/rapid_flow_parser.dart';

class RapidFlow extends StatelessWidget {
  final String styles;
  final List<Widget> children;

  const RapidFlow({
    super.key,
    required this.styles,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final RapidFlowParser parser =
        RapidFlowParser(styles: styles, context: context);
    return parser.render(children);
  }
}
