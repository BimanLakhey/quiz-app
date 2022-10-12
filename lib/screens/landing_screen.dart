// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/loggedUser.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/footer_container_widget.dart';
import 'package:nalandaquizgame/widgets/heading_container_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_button_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_text_field_widget.dart';
import 'package:nalandaquizgame/widgets/social_media_widget.dart';
import 'package:nalandaquizgame/widgets/text_button_widget.dart';
import 'package:http/http.dart' as http;

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  

  bool _emailValidate = false;
  bool _emailRegExValidate = false;
  bool _passwordValidate = false;

  var emailRegulator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");



  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void loginUser() async {
    try{
      var response = await http.post(Uri.parse('http://192.168.1.80:8000/loginUser/'), body: {'email': _emailController.text, 'password': _passwordController.text});
      var jsonData = json.decode(response.body);
      if(response.statusCode == 200)
      {
        loggedUserId = jsonData['id'].toString();
        loggedUsername = jsonData['name'];
        loggedUserEmail = jsonData['email'];
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar
        (
          const SnackBar
          (
            content: Text('Invalid login credentials!'),
          )
        );
      }
    }
    catch(e)
    {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/backgrounds/transparentBG.png").image,
              fit: BoxFit.cover,
            ),
            color: Color.fromARGB(255, 227, 219, 219)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeadingContainerWidget(containerText: "Nalanda Tripitak Quiz App", screenHeight: height, dividerHeight: 4,),
                SizedBox(height: height /  height / 0.03,),                
                TextFieldWidget(
                  textFieldHint: "Enter your email", 
                  controller: _emailController, 
                  textFieldError: "Email cannot be empty!", 
                  invalidEmailError: "Enter a valid email!",
                  validate: _emailValidate,
                  emailValidate: _emailRegExValidate,
                ),
                SizedBox(height: height / height / 0.04,),
                TextFieldWidget(
                  textFieldHint: "Enter your password", 
                  textFieldError: "Password cannot be empty!", 
                  controller: _passwordController, 
                  validate: _passwordValidate
                ),
                SizedBox(height: height / height / 0.03,),
                RoundedButtonWidget(
                  buttonText: "Login", 
                  width: width / 1.1, 
                  onpressed: ()  {

                    setState(() {
                      _emailController.text.isEmpty ? _emailValidate = true : _emailValidate = false;
                      _passwordController.text.isEmpty ? _passwordValidate = true : _passwordValidate = false;
                    });

                    if(_emailValidate == false && _passwordValidate == false){

                      if((!emailRegulator.hasMatch(_emailController.text) && _emailController.text.isNotEmpty) && _passwordController.text.isNotEmpty)
                      {
                        setState(() {
                          _emailRegExValidate = true;
                          _emailValidate = false;
                        });
                      }
                      else
                      {
                        setState(() {
                          _emailRegExValidate = false;
                          _emailValidate = false;
                          _passwordValidate = false;
                        });
                        loginUser();
                      }
                    }
                    
                  }
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonWidget(buttonText: "Forgot password?", textColor: Color(0xff042803), onPressed: () => Navigator.pushNamed(context, MyRoutes.resetPasswordRoute)),
                      TextButtonWidget(buttonText: "Continue as guest", textColor: Color.fromARGB(255, 41, 159, 32), onPressed: () => Navigator.pushNamed(context, MyRoutes.continueAsGuestRoute)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: height / 41),
                  child: Divider(thickness: 2, color: Color(0xff042803),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaWidget(onPressed: () {}, mediaName: "Facebook", buttonColor: Color(0xff3b5998)),
                    SizedBox(width: width / 10, child: Center(child: Text("OR", style: TextStyle(fontSize: width / 28),))),
                    SocialMediaWidget(onPressed: () {}, mediaName: "Google", buttonColor: Color(0xffDB4437))
                ],),
                SizedBox(height: height / height / 0.045,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FooterContainerWidget(containerText: 'Sign Up', screenHeight: height, screenWidth: width, onPressed: () => Navigator.pushNamed(context, MyRoutes.signUpRoute),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}