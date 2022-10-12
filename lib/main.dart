// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/screens/categories_screen.dart';
import 'package:nalandaquizgame/screens/change_password_screen.dart';
import 'package:nalandaquizgame/screens/continue_as_guest_screen.dart';
import 'package:nalandaquizgame/screens/home_screen.dart';
import 'package:nalandaquizgame/screens/landing_screen.dart';
import 'package:nalandaquizgame/screens/otp_verification_screen.dart';
import 'package:nalandaquizgame/screens/profile_screen.dart';
import 'package:nalandaquizgame/screens/quiz_leaderboard_screen.dart';
import 'package:nalandaquizgame/screens/quiz_level_screen.dart';
import 'package:nalandaquizgame/screens/quiz_result_screen.dart';
import 'package:nalandaquizgame/screens/quiz_screen.dart';
import 'package:nalandaquizgame/screens/reset_password_screen.dart';
import 'package:nalandaquizgame/screens/sign_up_screen.dart';
import 'package:nalandaquizgame/screens/splash_screen.dart';
import 'package:nalandaquizgame/screens/sub_categories_screen.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context) => LoadingScreen(),
        "/landingScreen": (context) => LandingScreen(),
        "/continueAsGuest": (context) => ContinueAsGuestScreen(),
        "/home": (context) => HomeScreen(),
        "/signUp": (context) => SignUpScreen(),
        "/resetPassword":(context) => ResetPasswordScreen(),
        "/otp": (context) => OTPVerificationScreen(),
        "/changePassword": (context) => ChangePasswordScreen(),
        "/quizLevel":(context) => QuizLevelScreen(),
        "/quiz":(context) => QuizScreen(),
        "/quizResult": (context) => QuizResultScreen(),
        "/quizLeaderboard": (context) => QuizLeaderboardScreen(),
        "/categories": (context) => CategoriesScreen(),
        "/subCategories": (context) => SubCategoriesScreen(),
        "/profile": (context) => ProfileScreen(),
      },
    );
  }
}