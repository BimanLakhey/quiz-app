import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding
    (
      padding: EdgeInsets.symmetric(horizontal: 30),
      child:  Divider(color: Colors.black54, thickness: 1)
    );
  }
}