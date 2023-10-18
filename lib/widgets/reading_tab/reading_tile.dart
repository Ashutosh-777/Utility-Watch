import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/months.dart';
import 'package:utility_watch/globals/styles.dart';
import 'package:utility_watch/pages/readings/month_readings.dart';

class ReadingsTile extends StatelessWidget {
  final String title;
  final String month;
  final int? reading;
  final int? previousReading;
  final String scale;
  const ReadingsTile({
    super.key,
    required this.month,
    this.reading = 0,
    this.previousReading = 0,
    required this.scale,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final increased = reading! > previousReading!;
    final change = reading! - previousReading!;
    final sign = increased ? "+" : "";
    final isFilled = month != months[DateTime.now().month];
    return GestureDetector(
      onTap: () {
        if (!isFilled) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MonthReadingScreen(
                title: title,
                month: month,
                previousReading: previousReading ?? 0,
                scale: scale,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.33,
        ),
        decoration: BoxDecoration(
          color: !isFilled ? MyColors.lightGreyColor : MyColors.whiteColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              month,
              style: MyStyles.heading,
            ),
            const SizedBox(height: 10),
            Text(
              isFilled ? "$sign$change" : "",
              style: MyStyles.subHeading.copyWith(
                color: increased ? MyColors.blueColor : Colors.greenAccent,
              ),
            ),
            isFilled
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "$reading   ",
                        style: MyStyles.normalTextStyle.copyWith(fontSize: 26),
                      ),
                      Text(
                        scale,
                        style: MyStyles.normalTextStyle.copyWith(fontSize: 18),
                      )
                    ],
                  )
                : Text(
                    ".  . . .",
                    style:
                        MyStyles.heading.copyWith(fontWeight: FontWeight.w900),
                  ),
          ],
        ),
      ),
    );
  }
}
