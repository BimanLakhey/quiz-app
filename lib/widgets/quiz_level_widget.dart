import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/screens/quiz_screen.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/popup_widget.dart';

class QuizLevelWidget extends StatelessWidget {

  final int order;

  QuizLevelWidget (this.order);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return InkWell(
      hoverColor: Colors.blue,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/drawable/map_vertical_point.png",
            fit: BoxFit.fitWidth,
            width: 40,
          ),
          Text("$order",
              style: TextStyle(color: Colors.black, fontSize: width / 30))
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),          
            child: PopupWidget(
              headingText: "Level $order", 
              mainText: "Play Level $order?", 
              onPressed: () {
                QuizScreen.order = order;
                Navigator.pushNamed(context, MyRoutes.quizRoute);
              }, 
              buttonText: "Yes"
            )
          ),
        );
      }
    );
  }
}