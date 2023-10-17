import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/styles.dart';
import 'package:utility_watch/pages/readings/dummy_data.dart';
import 'package:utility_watch/utils/back_button.dart';
import 'package:utility_watch/widgets/reading_tab/reading_change_tile.dart';
import 'package:utility_watch/widgets/reading_tab/reading_summary.dart';

class MonthReadingScreen extends StatefulWidget {
  final String title;
  final String month;
  final int previousReading;
  final String scale;
  const MonthReadingScreen({
    super.key,
    required this.title,
    required this.month,
    required this.previousReading,
    required this.scale,
  });

  @override
  State<MonthReadingScreen> createState() => _MonthReadingScreenState();
}

class _MonthReadingScreenState extends State<MonthReadingScreen> {
  int noOfTiles = 0;
  int selectedIndex = 0;
  double avgReading = 0;
  int finalReading = 0;

  @override
  void initState() {
    noOfTiles = (widget.previousReading / 10).floor() * 2;
    int total = 0;
    for (var map in energyReadings) {
      total += map['reading'] as int;
    }
    avgReading = total / energyReadings.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: MyColors.backgroundColor,
          elevation: 0,
          leading: backButton,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      widget.title,
                      style:
                          MyStyles.heading.copyWith(color: MyColors.blueColor),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    widget.month,
                    style: MyStyles.heading,
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Align(
                alignment: const Alignment(0, 0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 20),
                  decoration: const BoxDecoration(
                    color: MyColors.lightGreyColor,
                    border: Border.symmetric(
                      horizontal: BorderSide(color: MyColors.greyColor),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Approximate\nchange",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyColors.blueColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Align(
                alignment: const Alignment(0, 0),
                child: SizedBox(
                  height: size.height / 2,
                  child: ListWheelScrollView.useDelegate(
                    squeeze: 1,
                    diameterRatio: 2.5,
                    itemExtent: 60,
                    perspective: 0.01,
                    physics: const FixedExtentScrollPhysics(),
                    controller: FixedExtentScrollController(
                      initialItem: (noOfTiles / 2).floor(),
                    ),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedIndex = index;
                        finalReading = selectedIndex * 10;
                        if (index >= noOfTiles - 5) {
                          noOfTiles += 10;
                        }
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: noOfTiles,
                      builder: (context, index) {
                        return ReadingChangeTile(
                          reading: widget.previousReading,
                          increment: index * 10 - widget.previousReading,
                          highlight: index == selectedIndex ||
                              (index == (noOfTiles / 2).floor() &&
                                  selectedIndex == 0),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 1),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: ReadingSummary(
                  lastReading: widget.previousReading,
                  avgReading: avgReading,
                  scale: widget.scale,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
