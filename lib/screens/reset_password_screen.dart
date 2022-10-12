// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/footer_container_widget.dart';
import 'package:nalandaquizgame/widgets/heading_container_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_button_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_text_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = new TextEditingController();
  
  bool _emailValidate = false;

  @override
  void dispose() {
    _emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
              Column(
                children: [
                  HeadingContainerWidget(containerText: "Reset Password", screenHeight: height, dividerHeight: 4,),
                  SizedBox(height: height / 18,),
                  SizedBox(width: height / 3, child: Text("Enter the email associated with your account", style: TextStyle(fontSize: height / 40, color: Color(0xff042803)),)),
                  SizedBox(height: height / 18,),
                  TextFieldWidget(
                    textFieldHint: "Enter your email", 
                    textFieldError: "Email cannot be empty!", 
                    controller: _emailController, 
                    validate: _emailValidate
                  ),
                  SizedBox(height: height / 10,),
                  RoundedButtonWidget(
                    buttonText: "Send OTP", 
                    width: 350, 
                    onpressed: () {
                      setState(() {
                        _emailController.text.isEmpty ? _emailValidate = true : _emailValidate = false;

                      });
                      if(_emailValidate == false)
                      {
                        Navigator.pushNamed(context, MyRoutes.otpRoute);
                        
                      }
                    },
                  ),
                  SizedBox(height: height / 6.2,),
                  FooterContainerWidget(containerText: "Login", screenHeight: height, screenWidth: width, onPressed: () => Navigator.pushNamed(context, MyRoutes.landingRoute),)
                ],
              ),
            ],
          )
        ),
      )
    );
  }
}