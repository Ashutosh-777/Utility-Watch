import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utility_watch/globals/assets.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/months.dart';
import 'package:utility_watch/globals/styles.dart';
import 'package:utility_watch/pages/readings/dummy_data.dart';
import 'package:utility_watch/widgets/reading_tab/reading_tile.dart';

class ReadingPage extends StatelessWidget {
  ReadingPage({super.key});

  List<Widget> readingTiles = energyReadings
      .map((map) => ReadingsTile(
            month: map["month"]!,
            scale: 'kWh',
            reading: map["reading"],
            previousReading: map['previous_reading'],
            title: "Electricity Readings",
          ))
      .toList()
    ..add(
      ReadingsTile(
        month: months[DateTime.now().month]!,
        scale: 'kWh',
        previousReading: energyReadings
            .where((element) =>
                element['month'] == months[DateTime.now().month - 1])
            .last['reading'],
        title: "Electricity Readings",
      ),
    );

  List<Widget> waterReadings = energyReadings
      .map((map) => ReadingsTile(
            month: map["month"]!,
            scale: 'L',
            reading: map["reading"],
            previousReading: map['previous_reading'],
            title: "Water Readings",
          ))
      .toList()
    ..add(ReadingsTile(
      month: months[DateTime.now().month]!,
      scale: 'L',
      previousReading: energyReadings
          .where(
              (element) => element['month'] == months[DateTime.now().month - 1])
          .last['reading'],
      title: "Water Readings",
    ));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Energy Consumption",
                  style: MyStyles.heading,
                ),
                infoButton(onTap: () {})
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: readingTiles,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Water Consumption",
                  style: MyStyles.heading,
                ),
                infoButton(onTap: () {})
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: waterReadings,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: MyColors.lightGreyColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          Assets.infoIcon,
          color: MyColors.greyColor,
        ),
      ),
    );
  }
}
