import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/styles.dart';
import 'package:utility_watch/utils/number_format.dart';

class ReadingChangeTile extends StatelessWidget {
  final int reading;
  final int increment;
  final bool highlight;
  const ReadingChangeTile({
    super.key,
    required this.reading,
    required this.increment,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    final possitive = increment > 0;
    final formattedReading = formatNumberWithSpaces(reading + increment);
    final formattedIncrement = formatNumberWithSpaces(increment);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: highlight ? Colors.transparent : Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedReading,
            style: MyStyles.heading.copyWith(
              fontSize: highlight ? 32 : 28,
            ),
          ),
          const SizedBox(width: 40),
          Text(
            possitive ? "+ $formattedIncrement" : formattedIncrement,
            style: MyStyles.subHeading.copyWith(
              fontSize: highlight ? 26 : 18,
              color: possitive ? MyColors.blueColor : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
