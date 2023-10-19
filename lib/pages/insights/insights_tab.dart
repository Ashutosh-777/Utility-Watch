import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/months.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({super.key});

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  String? selectedValue = "Electricity";
  bool bill = true;
  String heading1 = "Monthly use of electricity in Kwh" ;
  String heading2 = "Weekly use of electricity in Kwh" ;
  SideTitles get _bottomTitles2 => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Mon';
              break;
            case 2:
              text = 'Tue';
              break;
            case 4:
              text = 'Wed';
              break;
            case 6:
              text = 'Thu';
              break;
            case 8:
              text = 'Fri';
              break;
            case 10:
              text = 'Sat';
              break;
          }

          return Text(text);
        },
      );

  final List<FlSpot> dummyData1 = [
    FlSpot(0, 10),
    FlSpot(2, 2),
    FlSpot(4, 8),
    FlSpot(6, 4),
    FlSpot(8, 5),
    FlSpot(10, 1),
  ];

    List<BarChartGroupData> _chartGroups() {
    return dummyData1
        .map((point) => BarChartGroupData(
            x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 2:
              text = 'Mar';
              break;
            case 4:
              text = 'May';
              break;
            case 6:
              text = 'Jul';
              break;
            case 8:
              text = 'Sep';
              break;
            case 10:
              text = 'Nov';
              break;
          }

          return Text(
            text,
            style: TextStyle(color: Colors.black),
          );
        },
      );

  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 2:
              text = '1';
              break;
            case 4:
              text = '2';
              break;
            case 6:
              text = '3';
              break;
            case 8:
              text = '4';
              break;
            case 10:
              text = '5';
              break;
          }

          return Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      );



  Widget LINECHART() {
    return Container(
      padding: EdgeInsets.all(20),
      child: LineChart(LineChartData(
        borderData: FlBorderData(border: Border(bottom: BorderSide())),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          leftTitles: AxisTitles(sideTitles: _leftTitles),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: dummyData1,
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            isStrokeCapRound: false,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      )),
    );
  }



  Widget BarGraph() {
    return AspectRatio(
      aspectRatio: 1,
      child: BarChart(
        BarChartData(
          barGroups: _chartGroups(),
          borderData: FlBorderData(
              border: const Border(
            bottom: BorderSide(),
          )),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles2),
            leftTitles: AxisTitles(sideTitles: _leftTitles,),
            topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        getTitlesWidget: (value, meta) => Container(),
                        showTitles: true,
                        reservedSize: 20,
                      ),
                    ),
             rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }

  Widget Electricity() {
    return Column(
      children: [
        Text(heading1,style: TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          decoration: BoxDecoration(
              color: MyColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: AspectRatio(aspectRatio: 1, child: LINECHART()),
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
        Text(heading2,style: TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          decoration: BoxDecoration(
              color: MyColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: BarGraph(),
        ),
      ],
    );
  }

  Widget Water() {
    return Column(
      children: [
         Text(heading1,style: TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
         Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          decoration: BoxDecoration(
              color: MyColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: AspectRatio(aspectRatio: 1, child: LINECHART()),
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
         Text(heading2,style: TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
         Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          decoration: BoxDecoration(
              color: MyColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: BarGraph(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Insights",
          style: TextStyle(color: MyColors.blueColor),
        ),
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: MyColors.backgroundColor,
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  height: 30,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: MyColors.greyColor)),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                        bill = newValue == 'Electricity';
                        heading1 = bill ? "Monthly use of electricity in Kwh" : "Monthly use of water in L";
                        heading2 = bill ? "Weekly use of electricity in Kwh" : "Weekly use of water in L";
                      });
                    },
                    underline: Container(),
                    items: <String>['Electricity', 'Water']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: MyColors.blueColor),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              margin: EdgeInsets.all(20),
              child: bill ? Electricity() : Water(),
            )
          ]),
        ),
      ),
    );
  }
}
