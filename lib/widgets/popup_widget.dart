import 'package:flutter/material.dart';

class PopupWidget extends StatelessWidget {
  final String headingText;
  final String mainText;
  final String buttonText;
  final Function onPressed;
  const PopupWidget({Key? key, required this.headingText, required this.mainText, required this.onPressed, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog
    (
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: width / 1.8,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset("assets/images/backgrounds/popUpBG.jpg", height: height / 5, width: width / 2, fit: BoxFit.contain, color: Color(0xff042803).withOpacity(0.5),),
              Align(
                alignment: Alignment.topCenter,
                child: Text("$headingText", style: TextStyle(fontSize: width / 18),),
              ),
              SizedBox( child: Text("$mainText", style: TextStyle(fontSize: width / 20),)),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(width/ 4, height / 17)),
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () => onPressed(), 
                  child: Text("$buttonText", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: width / 22),)
                  ),
                )
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.green.withOpacity(0.8),
      contentTextStyle: TextStyle(color: Colors.white),
    );
  }
}