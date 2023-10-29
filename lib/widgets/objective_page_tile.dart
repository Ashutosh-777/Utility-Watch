import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:utility_watch/globals/colors.dart';

class MyRoundedContainer extends StatelessWidget {
  final String heading;
  final String val;
  final String unit;

  const MyRoundedContainer({
    Key? key,
    required this.heading,
    required this.val,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                val,
                style: GoogleFonts.nunitoSans(
                  fontSize: 26,
                  color: MyColors.greyColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              val != '--'
                  ? Text(
                      unit,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        color: MyColors.greyColor,
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
