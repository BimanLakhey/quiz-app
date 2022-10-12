import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/loggedUser.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/footer_container_widget.dart';
import 'package:nalandaquizgame/widgets/heading_container_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_button_widget.dart';
import 'package:nalandaquizgame/widgets/rounded_text_field_widget.dart';

class ContinueAsGuestScreen extends StatefulWidget {
  ContinueAsGuestScreen({Key? key}) : super(key: key);

  @override
  State<ContinueAsGuestScreen> createState() => _ContinueAsGuestScreenState();
}

class _ContinueAsGuestScreenState extends State<ContinueAsGuestScreen> {
  final _nameController = TextEditingController();

  bool _nameValidate = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
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
            // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.modulate,)
          ),
          color: Color.fromARGB(255, 227, 219, 219)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  HeadingContainerWidget(containerText: "Continue as Guest", screenHeight: height, dividerHeight: 4,),
                  SizedBox(height: height / 18,),
                  SizedBox(width: height / 3, child: Text("You may continue as a guest by entering your name", style: TextStyle(fontSize: height / 40, color: Color(0xff042803)),)),
                  SizedBox(height: height / 18,),
                  TextFieldWidget(
                    textFieldHint: "Enter your name", 
                    textFieldError: "Name cannot be empty!", 
                    controller: _nameController, 
                    validate: _nameValidate
                  ),
                  SizedBox(height: height / 10,),
                  RoundedButtonWidget(
                    buttonText: "Continue", 
                    width: 350, 
                    onpressed: () {
                      setState(() { _nameController.text.isEmpty ? _nameValidate = true : _nameValidate = false;});
                      if(_nameValidate == false)
                      {
                        loggedUsername = _nameController.text;
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      }
                    }
                  ),
                  SizedBox(height: height / 6.2,),
                  FooterContainerWidget(containerText: "Login", screenHeight: height, screenWidth: width, onPressed: () => Navigator.pushNamed(context, MyRoutes.landingRoute),)
                ],
              ),
              
            ],
          )
        ),
      ),
    );
  }
}