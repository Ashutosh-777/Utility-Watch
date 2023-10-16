import 'package:flutter/material.dart';
import 'package:utility_watch/globals/colors.dart';
import 'package:utility_watch/pages/home/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSignUp = true;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        padding: EdgeInsets.only(top: 10),
                        height: screensize.height / 1.8,
                        width: double.maxFinite - 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Make SignIn button
                                SizedBox(
                                  width: 110,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isSignUp = false;
                                      });
                                    },
                                    child: Text('SignIn'),
                                    style: TextButton.styleFrom(
                                      backgroundColor: !isSignUp
                                          ? MyColors.blueColor
                                          : MyColors.lightGreyColor,
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                                // Make SignUp button
                                SizedBox(
                                  width: 110,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isSignUp = true;
                                      });
                                    },
                                    child: Text('SignUp'),
                                    style: TextButton.styleFrom(
                                      backgroundColor: isSignUp
                                          ? MyColors.blueColor
                                          : MyColors.lightGreyColor,
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            isSignUp ? SignUpWidget() : SignInWidget(),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: (screensize.width - 120) / 2,
                        child: ElevatedButton(
                          onPressed: () {
                            // Logic for sign up or sign in goes here

                            // Navigate to the home screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: isSignUp ? Text("SIGN UP") : Text("SIGN IN"),
                          style: ElevatedButton.styleFrom(
                            primary: MyColors.blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget SignUpWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter UserName",
            labelText: "UserName",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "UserName cannot be Empty";
            }
            return null;
          },
          onChanged: (value) {
            // name = value;
            // setState(() {});
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Phone Number",
            labelText: "Phone",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "Phone cannot be Empty";
            }
            return null;
          },
          onChanged: (value) {
            // name = value;
            // setState(() {});
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Your Email",
            labelText: "Email",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "UserName cannot be Empty";
            }
            return null;
          },
          onChanged: (value) {
            // name = value;
            // setState(() {});
          },
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter Password",
            labelText: "PassWord",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "Password cannot be empty";
            } else if (value != null && value.length < 6)
              return "Passsword length should be greater than 6";
            return null;
          },
        )
      ],
    ),
  );
}

Widget SignInWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Your Email",
            labelText: "Email",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "Email cannot be Empty";
            }
            return null;
          },
          onChanged: (value) {},
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter Password",
            labelText: "PassWord",
          ),
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "Password cannot be empty";
            } else if (value != null && value.length < 6)
              return "Passsword length should be greater than 6";
            return null;
          },
        )
      ],
    ),
  );
}
