import 'package:flutter/material.dart';
import 'package:rapid/parser/rapid_container_parser.dart';

class RapidContainer extends StatelessWidget {
  final String styles;
  final Widget child;

  const RapidContainer({
    super.key,
    required this.styles,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final RapidContainerParser parser =
        RapidContainerParser(styles: styles, context: context)
          ..parse(
            context,
          );
    return Container(
      key: key,
      decoration: parser.boxDecoration,
      width: parser.width,
      height: parser.height,
      margin: EdgeInsets.fromLTRB(
        parser.ml,
        parser.mt,
        parser.mr,
        parser.mb,
      ),
      padding: EdgeInsets.fromLTRB(
        parser.pl,
        parser.pt,
        parser.pr,
        parser.pb,
      ),
      child: LayoutBuilder(builder: (context, constrains) {
        parser.updateBoxConstraints(constrains);
        return ConstrainedBox(
          constraints: constrains,
          child: child,
        );
      }),
    );
  }
}
