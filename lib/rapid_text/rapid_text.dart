import 'package:flutter/material.dart';
import 'package:rapid/parser/rapid_text_parser.dart';

class RapidText extends StatelessWidget {
  final String styles;
  final String text;

  const RapidText({
    super.key,
    required this.text,
    required this.styles,
  });

  @override
  Widget build(BuildContext context) {
    final RapidTextParser parser =
        RapidTextParser(styles: styles, context: context)
          ..parse(
            context,
          );

    return Text(
      text,
      key: key,
      style: parser.textStyle,
      textAlign: parser.textAlign,
    );
  }
}
