import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuizAnswerWidget extends StatefulWidget {

  String radioValue;
  String get getRadioValue => radioValue;
  QuizAnswerWidget({Key? key, required this.radioValue}) : super(key: key);

  @override
  State<QuizAnswerWidget> createState() => _QuizAnswerWidgetState();
}

class _QuizAnswerWidgetState extends State<QuizAnswerWidget> {
  String singleValue = "";
  late String radioValue;
  @override
  Widget build(BuildContext context) {
    radioValue = widget.getRadioValue;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => setState(() {singleValue = "$radioValue";}),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text("$radioValue", style: TextStyle(color: Colors.white, fontSize:  width / 17),),
        leading: Transform.scale(
          scale: width / 500,
          child: Radio(
            value: "$radioValue",
            groupValue: singleValue,
            onChanged: (value) => setState(() {singleValue = value.toString();}),
            fillColor: MaterialStateProperty.all(Colors.green),            
          ),
        ),
      ),
    );

  }
}