import 'package:flutter/material.dart';
import 'package:rapid/rapid.dart';

class DemoCard extends StatelessWidget {
  const DemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RapidContainer(
        styles: "px-4 py-4 mx-8 my-8 bg-grey-900 rounded-md shadow-sm",
        child: RapidFlow(
          styles: "column items-center axis-min laptop:row desktop:row",
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              height: 16,
            ),
            RapidFlow(
              styles:
                  "column items-center axis-min laptop:items-start desktop:items-start",
              children: [
                RapidText(
                  text:
                      "Rapid allows flutter developers to create responsive sharable widgets in record time",
                  styles: "text-center text-white",
                ),
                SizedBox(
                  height: 12,
                ),
                RapidText(
                  text: "Adib Mohsin",
                  styles: "text-blue",
                ),
                SizedBox(
                  height: 8,
                ),
                RapidText(
                  text: "Layopay",
                  styles: "text-grey-500",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
