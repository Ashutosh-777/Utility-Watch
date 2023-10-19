import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/styles.dart';
import 'package:utility_watch/utils/number_format.dart';

class ReadingSummary extends StatelessWidget {
  final int lastReading;
  final double avgReading;
  final String scale;
  const ReadingSummary(
      {super.key,
      required this.lastReading,
      required this.avgReading,
      required this.scale});

  @override
  Widget build(BuildContext context) {
    final formattedreading = formatNumberWithSpaces(lastReading);
    final formattedAvgReading = formatNumberWithSpaces(avgReading.floor());
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.lightGreyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 40,
            color: MyStyles.subHeading.color,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Last Month - $formattedreading $scale",
                style: MyStyles.subHeading,
              ),
              Text(
                "Average per month - $formattedAvgReading${(avgReading % 1).toStringAsFixed(2).substring(1)} $scale",
                style: MyStyles.subHeading,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
