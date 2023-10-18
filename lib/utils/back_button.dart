import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/main.dart';

final backButton = IconButton(
  onPressed: () => navigatorKey.currentState!.pop(),
  icon: const Icon(
    Icons.arrow_back_ios_new_rounded,
    color: MyColors.blueColor,
  ),
);
