// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {

  final Function onPressed;
    final String mediaName;
    final Color buttonColor;
    double buttonElevation = 20;

  SocialMediaWidget({
    required this.onPressed, required this.mediaName, required this.buttonColor
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed(), 
      child: Text(mediaName, style: TextStyle(fontSize: width / 25),),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(width / 2.8, height / 14)),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shadowColor: MaterialStateProperty.all(buttonColor),
        elevation: MaterialStateProperty.all(buttonElevation),
      ),
    );
  }
}