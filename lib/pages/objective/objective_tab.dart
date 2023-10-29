import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/widgets/circular_progress_container.dart';
import 'package:utility_watch/widgets/objective_page_tile.dart';

class ObjectivePage extends StatefulWidget {
  ObjectivePage({super.key});

  @override
  State<ObjectivePage> createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String electricityConsumption = '--';
  String waterConsumption = '--';
  String monthlyElectricityGoal = '--';
  String monthlyWaterGoal = '--';

  void _updateConsumption(String type, String value) {
    setState(() {
      if (type == 'electricity') {
        electricityConsumption = value;
      } else if (type == 'water') {
        waterConsumption = value;
      } else if (type == 'monthlyElectricity') {
        monthlyElectricityGoal = value;
      } else if (type == 'monthlyWater') {
        monthlyWaterGoal = value;
      }
    });
  }

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
                  _buildRoundedContainer(
                      type: 'electricity',
                      heading: 'Electricity',
                      value: electricityConsumption),
                  SizedBox(width: 20),
                  _buildRoundedContainer(
                      type: 'water', heading: 'Water', value: waterConsumption),
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
                  _buildRoundedContainer(
                      type: 'monthlyElectricity',
                      heading: 'Electricity',
                      value: monthlyElectricityGoal),
                  SizedBox(width: 20),
                  _buildRoundedContainer(
                      type: 'monthlyWater',
                      heading: 'Water',
                      value: monthlyWaterGoal),
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
                      heading: "Electricity", percentage: "Goal not Set"),
                  // SizedBox(width: 10),
                  MyPercentageContainer(heading: "Water", percentage: "Goal not Set"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedContainer(
      {required String type, required String heading, required String value}) {
    return GestureDetector(
      onTap: () {
        print("Data Modified on ${DateTime.now()}");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Enter $heading Consumption'),
              content: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Enter value'),
                  onSaved: (value) {
                    if (value != null) {
                      _updateConsumption(type, value);
                    }
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
      child: MyRoundedContainer(
        heading: heading,
        val: value,
        unit: heading == 'Electricity' ? "kWh" : 'L',
      ),
    );
  }
}
