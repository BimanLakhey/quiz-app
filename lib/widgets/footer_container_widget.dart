// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class FooterContainerWidget extends StatelessWidget {
  final String containerText;
  final double screenHeight;
  final double screenWidth;
  final Function onPressed;

  FooterContainerWidget({
    required this.containerText, required this.screenHeight, required this.screenWidth, required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: screenHeight / 7,
      width: screenWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          Color(0xff354A33),
          Color(0xff042803),
          ],
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(260))
      ),
      child: Container(
        width: screenHeight / 6,
        height: screenHeight / 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],

        ),
        child: TextButton(
          child: Text(containerText, style: TextStyle(color: Color.fromARGB(255, 41, 159, 32), fontSize: screenHeight / 40),), 
          onPressed: () {onPressed();}
        )
      )
    );
  }
}