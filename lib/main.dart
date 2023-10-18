import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/pages/SignUpSignIn/signup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: MyColors.backgroundColor,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Utility-Watch',
      theme: ThemeData(),
      home: SignUpPage(),  
    );
  }
}
