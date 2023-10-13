import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/months.dart';
import 'package:utility_watch/globals/styles.dart';
import 'package:utility_watch/pages/readings/dummy_data.dart';
import 'package:utility_watch/widgets/reading_tab/reading_tile.dart';

class ReadingsPage extends StatelessWidget {
  ReadingsPage({super.key});

  List<Widget> readingTiles = energyReadings
      .map((map) => ReadingsTile(
            month: map["month"]!,
            scale: 'kWh',
            reading: map["reading"],
            previousReading: map['previous_reading'],
          ))
      .toList()
    ..add(ReadingsTile(month: months[DateTime.now().month]!, scale: 'kWh'));

  List<Widget> waterReadings = energyReadings
      .map((map) => ReadingsTile(
            month: map["month"]!,
            scale: 'Ltr',
            reading: map["reading"],
            previousReading: map['previous_reading'],
          ))
      .toList()
    ..add(ReadingsTile(month: months[DateTime.now().month]!, scale: 'Ltr'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 44),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Readings",
                style: MyStyles.subHeading.copyWith(
                  color: MyColors.blueColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Energy Consumption",
                style: MyStyles.heading,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: MyColors.greyColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: readingTiles,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Water Consumption",
                style: MyStyles.heading,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: MyColors.greyColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
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
}
