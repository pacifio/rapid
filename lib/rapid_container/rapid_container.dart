import 'package:flutter/material.dart';
import 'package:rapid/parser/rapid_container_parser.dart';

class RapidContainer extends StatelessWidget {
  final String styles;
  final Widget child;

  final double? width;
  final double? height;

  const RapidContainer({
    super.key,
    required this.styles,
    required this.child,
    this.width,
    this.height,
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
      width: width ?? parser.size?.width,
      height: height ?? parser.size?.height,
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
