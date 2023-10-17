import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final String imagePath;
  final TextEditingController controller;

  const RoundedTextField({
    Key? key,
    required this.hintText,
    required this.imagePath,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Calculate the width and height based on screen size
    double width = screenSize.width * 0.6; // 60% of the screen width
    double height = screenSize.height * 0.05; // 6% of the screen height

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color.fromRGBO(143, 143, 143, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Row(
          children: [
            Container(
              width: height - 14,
              height: height - 14,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: IntrinsicWidth(
                  stepWidth: width,
                  child: Container(
                    height: height,
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromRGBO(114, 114, 127, 1),
                        fontFamily: 'SF Pro Text',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
