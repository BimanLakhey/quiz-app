// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {

  final String buttonText;
  final Color textColor;
  final Function onPressed;

  TextButtonWidget({
    required this.buttonText,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return TextButton(
      onPressed: () {onPressed();}, 
      child: Text(
        buttonText, 
        style: TextStyle(
          color: textColor, 
          fontSize: height / 45
        )
      )
    );
  }
}