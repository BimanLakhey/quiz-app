// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/popup_widget.dart';
import 'package:nalandaquizgame/widgets/quiz_answer_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  static late int order;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  String singleValue = "";
  int questionNo = 0;
  int totalQuestions = 0;
  var questions = ["What is the sixth planet in the solar system?", "How many days are there in a year?", "How many days are there in a week?"];
  // var answers = {};

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    totalQuestions = questions.length-1;
    // var answers = {questions[0]: ["Mercury", "Earth", "Saturn", "Pluto"]};

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (ctx) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: PopupWidget(headingText: "Exit", 
            mainText: "Do you wish to exit the quiz?", 
            onPressed: () {Navigator.pushNamed(context, MyRoutes.quizLevelRoute);}, 
            buttonText: "Yes")
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Level ${QuizScreen.order}", style: TextStyle(fontSize: height / 30),),
          elevation: 0,
          backgroundColor: Color(0xff042803),
        ),
        backgroundColor: Color(0xff042803),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,height / 25,20,0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$questionNo/$totalQuestions", style: TextStyle(color: Colors.green, fontSize: width / 20)),
                SizedBox(height: height / 50,),
                Text(questions[questionNo], style: TextStyle(color: Colors.white, fontSize: width / 18),),
                SizedBox(height: height / 35),
                QuizAnswerWidget(radioValue: "Mercury"),
                SizedBox(height: height / 35),
                QuizAnswerWidget(radioValue: "Saturn"),
                SizedBox(height: height / 35),
                QuizAnswerWidget(radioValue: "Earth"),
                SizedBox(height: height / 35),
                QuizAnswerWidget(radioValue: "Pluto"),
                SizedBox(height: height / 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if(questionNo > 0)
                        {
                          setState(() {
                            questionNo--;
                            
                          });
                        }
                      }, 
                      child: Text("Previous", style: TextStyle(fontSize: width / 20)),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(width / 2.5, height / 11)),
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(questionNo < totalQuestions)
                        {
                          setState(() {
                            questionNo++;
                            
                          });
                          // Navigator.pushNamed(context, MyRoutes.quizRoute);
                        }
                        else if(questionNo == totalQuestions)
                        {

                          Navigator.pushNamed(context, MyRoutes.quizResultRoute);
                        }
                        
                      }, 
                      child: questionNo == totalQuestions ? Text("Continue", style: TextStyle(fontSize: width / 20)): Text("Next", style: TextStyle(fontSize: width / 20)),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(width / 2.5, height / 11)),
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}