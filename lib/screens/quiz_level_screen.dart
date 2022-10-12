// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_levels_scrolling_map/game_levels_scrolling_map.dart';
import 'package:game_levels_scrolling_map/model/point_model.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/popup_widget.dart';
import 'package:nalandaquizgame/widgets/quiz_level_widget.dart';

class QuizLevelScreen extends StatefulWidget {
  const QuizLevelScreen({Key? key}) : super(key: key);
  static int quizLevel = 0;

  @override
  State<QuizLevelScreen> createState() => _QuizLevelScreenState();
}

class _QuizLevelScreenState extends State<QuizLevelScreen> {

  int quizLevel = QuizLevelScreen.quizLevel;

  @override
  void initState() {
    // TODO: implement initState
    fillTestData();
  }

  List<PointModel> points = [];

  void fillTestData() {
    for (int i = 0; i <= quizLevel; i++) {
      points.add(PointModel(100, QuizLevelWidget(i)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (ctx) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: PopupWidget(headingText: "Home", mainText: "Do you wish to go home?", onPressed: () {Navigator.pushNamed(context, MyRoutes.homeRoute);}, buttonText: "yes")
          )
        );
        return false;
      },
      child: Scaffold(
        body: GameLevelsScrollingMap.scrollable(
          imageUrl:"assets/images/drawable/map_vertical.png",
          direction: Axis.vertical,
          reverseScrolling: true,
          pointsPositionDeltaX: 25,
          pointsPositionDeltaY: 30,
          svgUrl: 'assets/images/svg/map_vertical.svg',
          points: points,), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}