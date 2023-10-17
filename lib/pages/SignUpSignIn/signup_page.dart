import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/pages/home/home.dart';
import 'package:utility_watch/widgets/rounded_text_feilds.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  bool isSignUp = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailControllerSignIn = TextEditingController();
  final passwordControllerSignIn = TextEditingController();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset(
                      "asset/images/image 3.png",
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        margin:
                            EdgeInsets.only(right: 40, left: 40, bottom: 25),
                        padding: EdgeInsets.only(top: 10),
                        height: screenSize.height / 1.8,
                        width: double.maxFinite - 150,
                        child: Center(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 188,
                                decoration: BoxDecoration(
                                    color: MyColors.lightGreyColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSignUp = false;
                                        });
                                      },
                                      child: Container(
                                          width: 94,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: isSignUp
                                                ? MyColors.lightGreyColor
                                                : MyColors.blueColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Sign In',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: isSignUp
                                                      ? MyColors.greyColor
                                                      : Colors.white,
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSignUp = true;
                                        });
                                      },
                                      child: Container(
                                          width: 94,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: isSignUp
                                                ? MyColors.blueColor
                                                : MyColors.lightGreyColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Sign Up',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: isSignUp
                                                      ? Colors.white
                                                      : MyColors.greyColor,
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: screenSize.height/1.8 - 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  ...isSignUp
                                        ? SignUpWidget(
                                            userNameController,
                                            phoneController,
                                            emailController,
                                            passwordController)
                                        : SignInWidget(emailControllerSignIn,
                                            passwordControllerSignIn),
                                ],),
                              ),
                              // ...isSignUp
                              //     ? SignUpWidget(
                              //         userNameController,
                              //         phoneController,
                              //         emailController,
                              //         passwordController)
                              //     : SignInWidget(emailControllerSignIn,
                              //         passwordControllerSignIn),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: screenSize.width / 2 - 80,
                        child: SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            child: isSignUp ? Text("SIGN UP") : Text("SIGN IN"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.blueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> SignUpWidget(
    TextEditingController userNameController,
    TextEditingController phoneController,
    TextEditingController emailController,
    TextEditingController passwordController) {
  return [
    RoundedTextField(
        hintText: "UserName",
        imagePath: "asset/images/Image13.png",
        controller: userNameController),
    RoundedTextField(
        hintText: "Phone",
        imagePath: "asset/images/Image7.png",
        controller: phoneController),
    RoundedTextField(
        hintText: "Email",
        imagePath: "asset/images/Image10.png",
        controller: emailController),
    RoundedTextField(
        hintText: "Password",
        imagePath: "asset/images/Image11.png",
        controller: passwordController),
  ];
}

List<Widget> SignInWidget(TextEditingController emailController,
    TextEditingController passwordController) {
  return [
    RoundedTextField(
        hintText: "Email",
        imagePath: "asset/images/Image10.png",
        controller: emailController),
    RoundedTextField(
        hintText: "Password",
        imagePath: "asset/images/Image11.png",
        controller: passwordController),
  ];
}

