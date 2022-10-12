// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/screens/quiz_level_screen.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/drawer_widget.dart';
import 'package:nalandaquizgame/widgets/heading_container_widget.dart';
import 'package:nalandaquizgame/widgets/popup_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (ctx) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: PopupWidget(
              headingText: "Logout", 
              mainText: "Do you wish to logout?", 
              onPressed: () {Navigator.pushNamed(context, MyRoutes.landingRoute);}, 
              buttonText: "Yes"
            )
          ),
        );
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          // title: Text("Biman Lakhey"),
          backgroundColor: Color(0xff354A33),
          elevation: 0,
          actions: <Widget>[
            TextButton(
              onPressed: () {}, 
              child: Icon(Icons.notifications_none_rounded, size: height / 25, color: Colors.white)
            )
          ],
        ),
        drawer: DrawerWidget(),
        body:  Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/backgrounds/transparentBG.png").image,
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate,)
            ),
            color: Color.fromARGB(255, 227, 219, 219)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeadingContainerWidget(containerText: "Home", screenHeight: height, dividerHeight: 7,),
                SizedBox(height: height / 18,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(thickness: 2, color: Color(0xff042803),),
                ),
                SizedBox(height: height / 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("0", style: TextStyle(color: Color(0xff042803), fontSize: height / 35),),
                        Text("High Score", style: TextStyle(color: Color(0xff042803), fontSize: height / 35),)
                      ],
                    ),
                    SizedBox(width: height / 10,),
                    Column(
                      children: [
                        Text("${QuizLevelScreen.quizLevel}", style: TextStyle(color: Color(0xff042803), fontSize: height / 35),),
                        Text("Current Level", style: TextStyle(color: Color(0xff042803), fontSize: height / 35),)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height / 25,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(thickness: 2, color: Color(0xff042803),),
                ),
                SizedBox(height: height / 11,),
                RoundedButtonWidget(buttonText: "Play Quiz", width: width, onpressed: () {Navigator.pushNamed(context, MyRoutes.categoriesRoute);}),
                SizedBox(height: height / 12,),
                RoundedButtonWidget(buttonText: "View Leaderboard", width: width, onpressed: () {Navigator.pushNamed(context, MyRoutes.quizLeaderboardRoute);}),
              ]
            )
          )
        )
      ),
    );
  }
}