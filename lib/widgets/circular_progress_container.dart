import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:utility_watch/globals/colors.dart';

class MyPercentageContainer extends StatefulWidget {
  final String heading;
  String percentage;

  MyPercentageContainer({
    Key? key,
    required this.heading,
    required this.percentage,
  }) : super(key: key);

  @override
  State<MyPercentageContainer> createState() => _MyPercentageContainerState();
}

class _MyPercentageContainerState extends State<MyPercentageContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _updateConsumption(String value) {
    setState(() {
      widget.percentage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Data Modified on ${DateTime.now()}");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Enter heading Consumption'),
              content: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Enter value'),
                  onSaved: (value) {
                    if (value != null) {
                      _updateConsumption(value);
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: (MediaQuery.of(context).size.width - 80) / 2,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.heading,
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
                percent:  widget.percentage!='Goal not Set'? double.parse(widget.percentage) / 100: 0.0,
                center: SizedBox(
                  width: 60,
                  child: Center(
                    child: Text(widget.percentage != 'Goal not Set' ?
                      widget.percentage + '%' : widget.percentage,
                      style: TextStyle(fontWeight:widget.percentage != 'Goal not Set' ?FontWeight.bold:FontWeight.normal,fontSize: 
                          widget.percentage == 'Goal not Set' ? 15.0 : 20.0, color:widget.percentage == 'Goal not Set'? MyColors.greyColor:Colors.black),
                    ),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: MyColors.blueColor,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
