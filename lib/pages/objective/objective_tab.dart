import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/widgets/circular_progress_container.dart';
import 'package:utility_watch/widgets/objective_page_tile.dart';

class ObjectivePage extends StatelessWidget {
  const ObjectivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Consumption",
                style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  color: MyColors.greyColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRoundedContainer(
                      heading: "Electricity", val: "9 530", unit: "kWh"),
                  SizedBox(width: 20),
                  MyRoundedContainer(heading: "Water", val: "2 585", unit: "L"),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Monthly Goals",
                style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  color: MyColors.greyColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyRoundedContainer(
                      heading: "Electricity", val: "9 530", unit: "kWh"),
                  SizedBox(width: 20),
                  MyRoundedContainer(heading: "Water", val: "2 585", unit: "L"),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Track Your Goals",
                style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  color: MyColors.greyColor,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyPercentageContainer(
                      heading: "Electricity", percentage: "60%"),
                  // SizedBox(width: 10),
                  MyPercentageContainer(heading: "Water", percentage: "40%"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
