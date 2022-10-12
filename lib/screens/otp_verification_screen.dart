// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/footer_container_widget.dart';
import 'package:nalandaquizgame/widgets/heading_container_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_button_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    OtpFieldController _otpController = OtpFieldController();
    bool otpValidate = false;

    return Scaffold(
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
              Column(
                children: [
                  HeadingContainerWidget(containerText: "OTP Verification", screenHeight: height, dividerHeight: 4,),
                  SizedBox(height: height / 18,),
                  SizedBox(width: height / 3, child: Text("Enter the code we have sent to your email", style: TextStyle(fontSize: height / 40, color: Color(0xff042803)),)),
                  SizedBox(height: height / 18,),
                  OTPTextField(
                    controller: _otpController,
                    hasError: otpValidate,
                    length: 4,
                    fieldWidth: width / 7,
                    width: MediaQuery.of(context).size.width,
                    style: TextStyle(
                      fontSize: width / 10
                    ),
                    onChanged: (value) => null,
                    onCompleted: (value) {
                      setState(() {
                        otpValidate = false;
                      });
                      if(otpValidate == false)
                      {
                        Navigator.of(context).pushNamed(MyRoutes.changePasswordRoute);
                      }
                    },
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                      focusBorderColor: Color.fromARGB(255, 41, 159, 32)
                    ),
                  ),
                  // SizedBox(height: height / 10,),
                  // RoundedButtonWidget(
                  //   buttonText: "Verify", 
                  //   width: 350, 
                  //   onpressed: () {
                  //     if(_otpController.toString() != null)
                  //     {
                  //       print(_otpController.toString());
                  //     }
                  //     // Navigator.pushNamed(context, MyRoutes.changePasswordRoute);
                  //   }
                  // ),
                  SizedBox(height: height / 2.78,),
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