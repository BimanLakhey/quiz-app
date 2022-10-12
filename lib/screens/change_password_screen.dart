import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/footer_container_widget.dart';
import 'package:nalandaquizgame/widgets/heading_container_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_button_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_text_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordController = new TextEditingController();
  final _rePasswordController = new TextEditingController();
  

  bool _passwordValidate = false;
  bool _rePasswordValidate = false;
  bool _unmatchedPasswordValidate = false;


  @override
  void dispose() {
    _rePasswordController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Container(
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
                  HeadingContainerWidget(containerText: "Change Password", screenHeight: height, dividerHeight: 4,),
                  SizedBox(height: height / 18,),
                  SizedBox(width: height / 3, child: Text("Enter a new strong password", style: TextStyle(fontSize: height / 40, color: Color(0xff042803)),)),                
                  SizedBox(height: height / 18,),
                  // TextFieldWidget("Enter your new password"),
                  TextFieldWidget(
                    textFieldHint: "Enter your new password", 
                    textFieldError: 'New password cannot be empty!', 
                    controller: _passwordController, 
                    validate: _passwordValidate
                  ),
                  SizedBox(height: height / 28),
                  // TextFieldWidget("Re-enter your new password"),
                  TextFieldWidget(
                    textFieldHint: "Re-enter your new password", 
                    textFieldError: "Re-entered password cannot be empty!", 
                    controller: _rePasswordController, 
                    validate: _rePasswordValidate,
                    passwordValidate: _unmatchedPasswordValidate,
                    unmatchedPassworError: "Passwords do not match!",
                  ),
                  SizedBox(height: height / 10,),
                  RoundedButtonWidget(
                    buttonText: "Reset", 
                    width: 350, 
                    onpressed: () {
                      setState(() {
                        _rePasswordController.text.isEmpty ? _rePasswordValidate = true : _rePasswordValidate = false;
                        _passwordController.text.isEmpty ? _passwordValidate = true : _passwordValidate = false;

                      });
                      if(!_passwordValidate && !_rePasswordValidate)
                      {
                        if(_passwordController.text != _rePasswordController.text)
                        {
                          setState(() {
                            _unmatchedPasswordValidate = true;
                            _passwordValidate = false;
                          });
                        }
                        else
                        {
                          Navigator.pushNamed(context, MyRoutes.landingRoute);
                        }
                      }
                    }
                  ),
                  SizedBox(height: height / 13.4,),
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