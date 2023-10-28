import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utility_watch/globals/assets.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/globals/styles.dart';
import 'package:utility_watch/pages/account/account_tab.dart';
import 'package:utility_watch/pages/insights/insights_tab.dart';
import 'package:utility_watch/pages/objective/objective_tab.dart';
import 'package:utility_watch/pages/readings/readings_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    ReadingPage(),
    const InsightsPage(),
    ObjectivePage(),
    const AccountPage(),
  ];

  List<String> labels = [
    "Reading",
    "Insights",
    "Objective",
    "Account",
  ];

  List<String> titles = ["Your Readings", "", "Goal Settings", ""];

  void updateTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titles[selectedIndex] != ""
          ? AppBar(
              elevation: 0,
              backgroundColor: MyColors.backgroundColor,
              title: Text(
                titles[selectedIndex],
                style: MyStyles.heading.copyWith(color: MyColors.blueColor),
              ),
              centerTitle: true,
            )
          : null,
      backgroundColor: MyColors.backgroundColor,
      body: tabs[selectedIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      backgroundColor: MyColors.backgroundColor,
      showUnselectedLabels: true,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedIconTheme: const IconThemeData(size: 30),
      fixedColor: MyColors.blueColor,
      onTap: (value) => updateTab(value),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.readingsIcon,
            color: labels[selectedIndex] == "Reading"
                ? MyColors.blueColor
                : MyColors.greyColor,
            height: 24,
          ),
          label: "Reading",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.insightsIcon,
            color: labels[selectedIndex] == "Insights"
                ? MyColors.blueColor
                : MyColors.greyColor,
            height: 24,
          ),
          label: "Insights",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.objectiveIcon,
            color: labels[selectedIndex] == "Objective"
                ? MyColors.blueColor
                : MyColors.greyColor,
            height: 26,
          ),
          label: "Objective",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Assets.accountIcon,
            color: labels[selectedIndex] == "Account"
                ? MyColors.blueColor
                : MyColors.greyColor,
            height: 26,
          ),
          label: "Account",
        ),
      ],
    );
  }
}
