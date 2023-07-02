library rapid;

import 'package:flutter/material.dart';
import 'package:rapid/parser/rapid_container_parser.dart';

class RapidContainer extends StatefulWidget {
  final String styles;
  const RapidContainer({
    super.key,
    required this.styles,
  });

  @override
  State<RapidContainer> createState() => _RapidContainerState();
}

class _RapidContainerState extends State<RapidContainer> {
  late RapidContainerParser parser;

  @override
  void initState() {
    super.initState();
    parser = RapidContainerParser(
      styles: widget.styles,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: parser.boxDecoration,
    );
  }
}
