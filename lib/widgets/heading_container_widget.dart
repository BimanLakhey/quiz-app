// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HeadingContainerWidget extends StatelessWidget {

  final String containerText;
  final double screenHeight;
  final double dividerHeight;
  
  HeadingContainerWidget({
    required this.containerText, required this.screenHeight, required this.dividerHeight
  });

    @override
    Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Container(
                height: screenHeight / dividerHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff354A33),
                      Color(0xff042803),
                    ],
                  ),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(260))
                ),
                child: Center(
                  child: SizedBox(
                    width: screenWidth / 2, 
                    child: Center(
                      child: Text(
                        containerText, 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: screenWidth / 15 
                        )
                      )
                    )
                  )
                ),
              );
  }
}