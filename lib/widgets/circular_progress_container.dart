import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:utility_watch/globals/colors.dart';

class MyPercentageContainer extends StatelessWidget {
  final String heading;
  final String percentage;

  const MyPercentageContainer({
    Key? key,
    required this.heading,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          width: (MediaQuery.of(context).size.width - 60) / 2,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  heading,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: MyColors.greyColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: CircularPercentIndicator(
                  radius: 50.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.7,
                  center: new Text(
                    percentage,
                    style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: MyColors.blueColor,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
