// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
class TextFieldWidget extends StatelessWidget{
      final String textFieldHint;
      final String textFieldError;
      final TextEditingController controller;
      final bool validate;
      final bool? emailValidate;
      final bool? passwordValidate;
      final String? invalidEmailError;
      final String? unmatchedPassworError;
      TextFieldWidget({required this.textFieldHint,required this.textFieldError,required this.controller,required this.validate, this.invalidEmailError, this.emailValidate, this.unmatchedPassworError, this.passwordValidate});

      @override 
      Widget build (BuildContext context){
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: controller,
            style: TextStyle(color: Color(0xff354A33)),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(width: 2,color: Color(0xff354A33)),
              ),
              hintText: textFieldHint,
              errorText: validate ? textFieldError : emailValidate == true ? invalidEmailError : passwordValidate == true ? unmatchedPassworError : null,
              hintStyle: TextStyle(fontSize: width/ 25),
              contentPadding: EdgeInsets.symmetric(horizontal:15, vertical: height / 35),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              )
            ),
          ),
        );
      }
    }