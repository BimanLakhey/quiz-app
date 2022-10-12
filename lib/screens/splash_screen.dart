// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/routes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SplashScreen(
      seconds: 4,
      imageBackground: Image.asset("assets/images/backgrounds/transparentBG.png",).image,
      backgroundColor: Color.fromARGB(255, 227, 219, 219),
      navigateAfterSeconds: MyRoutes.landingRoute,
      image: Image.asset("assets/images/logos/logo.png"),
      photoSize: height / 4,
      loaderColor: Color(0xff042803),
      loadingText: Text("By Nalanda Tripitak", style: TextStyle(color: Color(0xff042803), fontSize: height / 30),),
    );
  }
}