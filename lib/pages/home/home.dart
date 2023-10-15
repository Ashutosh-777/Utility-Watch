import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
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
    ReadingsPage(),
    const InsightsPage(),
    const ObjectivePage(),
    const AccountPage(),
  ];

  void updateTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: tabs[selectedIndex],
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      backgroundColor: MyColors.backgroundColor,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 11,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedIconTheme: const IconThemeData(
        size: 26,
        color: MyColors.greyColor,
      ),
      selectedIconTheme: const IconThemeData(size: 30),
      fixedColor: MyColors.blueColor,
      onTap: (value) => updateTab(value),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.speed_rounded,
          ),
          label: "Reading",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notes_rounded,
          ),
          label: "Insights",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.circle_rounded,
          ),
          label: "Objective",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Account",
        ),
      ],
    );
  }
}
