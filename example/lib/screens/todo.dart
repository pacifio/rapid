import 'package:flutter/material.dart';
import 'package:rapid/rapid.dart';

class Todo extends StatelessWidget {
  final String title;
  const Todo({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RapidContainer(
      styles: "rounded-sm bg-grey-100 shadow-sm px-8 py-4 mx-4 my-4",
      child: RapidFlow(
        styles: "row mobile:column justify-between laptop:row desktop:row",
        children: [
          RapidFlow(
            styles: "column items-start",
            children: [
              RapidText(text: title, styles: "text-xl font-bold"),
              const RapidText(
                  text: "IMPORTANT", styles: "text-xs font-semibold"),
            ],
          ),
          const RapidFlow(
            styles: "column items-end",
            children: [
              RapidText(text: "DATE", styles: "text-grey-400 font-bold"),
              RapidText(text: "12th Nov, 2023", styles: "text-lg font-black"),
            ],
          )
        ],
      ),
    );
  }
}
