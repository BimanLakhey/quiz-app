import 'package:flutter/material.dart';
import 'package:nalandaquizgame/screens/quiz_level_screen.dart';
import 'package:nalandaquizgame/screens/quiz_screen.dart';
import 'package:nalandaquizgame/utils/routes.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int quizFinalResult = 20;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Level ${QuizScreen.order} Result", style: TextStyle(fontSize: width / 20),),
            elevation: 0,
            backgroundColor: Color(0xff042803),
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Color(0xff042803),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30,height / 15,30,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total correct answers:", style: TextStyle(color: Colors.white, fontSize: width / 20)),
                  SizedBox(height: height / 50,),
                  Text("2 out of 2 Questions", style: TextStyle(color: Colors.green, fontSize: width / 23),),
                  SizedBox(height: height / 15),
                  Container(
                    padding: EdgeInsets.all(30),
                    width: width / 1.1,
                    // height: height / 2,
                    // width: width / 1.12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(200),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height / 25),
                        Text("Your final score is", style: TextStyle(color: Colors.white, fontSize: width / 15),),
                        SizedBox(height: height/ 20),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: width / 2.5,
                          width: width / 2.5,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 11, 77, 13),
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Center(child: Text("$quizFinalResult", style: TextStyle(color: Colors.white, fontSize: width / 10),)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height / 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.quizRoute);
                        }, 
                        child: Text("Play again", style: TextStyle(fontSize: width / 20)),
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
                          QuizLevelScreen.quizLevel++;
                          Navigator.pushNamed(context, MyRoutes.quizLevelRoute);
                        },                      
                        child: Text("Next level", style: TextStyle(fontSize: width / 20)),
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
                ]
              )
          )
        )
      ),
    );
  }
}