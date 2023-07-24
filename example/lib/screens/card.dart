import 'package:flutter/material.dart';
import 'package:rapid/rapid.dart';

class DemoCard extends StatelessWidget {
  const DemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RapidContainer(
        styles:
            "px-4 py-4 mx-8 my-8 bg-grey-900 rounded-lg shadow-sm laptop:px-0 laptop:py-0",
        child: RapidFlow(
          styles: "column items-center axis-min laptop:row desktop:row",
          children: [
            RapidContainer(
              styles:
                  "w-16 h-16 laptop:w-32 laptop:h-40 rounded-full desktop:rect bg-grey-800 laptop:rounded-md",
              child: SizedBox(),
            ),
            SizedBox(
              height: 16,
            ),
            RapidContainer(
                styles: "laptop:px-8",
                child: RapidFlow(
                  styles:
                      "column items-center axis-min laptop:items-start desktop:items-start",
                  children: [
                    RapidContainer(
                      styles: "laptop:w-96",
                      child: RapidText(
                        text:
                            "Rapid allows flutter developers to create responsive sharable widgets in record time with utility first tailwind like classes",
                        styles:
                            "text-center text-white text-md laptop:text-left laptop:leading-relaxed",
                      ),
                    ),
                    RapidContainer(
                      styles: "pt-4",
                      child: RapidText(
                        text: "Adib Mohsin",
                        styles: "text-blue",
                      ),
                    ),
                    RapidContainer(
                      styles: "pt-1",
                      child: RapidText(
                        text: "layopay",
                        styles: "text-grey-500 uppercase text-xs",
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
