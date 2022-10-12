// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/loggedUser.dart';
import 'package:nalandaquizgame/utils/routes.dart';
import 'package:nalandaquizgame/widgets/popup_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        children: [
          SizedBox
            (
              height: width / 2,
              child: DrawerHeader
              ( 
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff354A33),
                      Color(0xff042803),
                    ],
                  ),
                ),
                child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: 
                  [
                    Container
                      (
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration
                        (
                          boxShadow: 
                          // ignore: prefer_const_literals_to_create_immutables
                          [
                            BoxShadow(color: Colors.white, spreadRadius: 2, blurRadius: 4)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        width: width / 5.2,
                        height: width / 5.2,
                        child: SizedBox(child: CircularProgressIndicator(color: Color(0xff042803),))
                      ),
                    Text
                    (
                      loggedUsername != null ? loggedUsername.toString() : "Guest", 
                      style: TextStyle
                      (
                        fontSize: width / 20, 
                        color: Colors.white
                      ),
                    ),
                  ],
                )
              ),
            ),
            Padding
            (
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text
              (
                "User",
                style: TextStyle(fontSize: width / 20, color: Colors.black54),
              ),
            ),
            ListTile
            (
              onTap: () => Navigator.pushNamed(context, MyRoutes.profileRoute),
              horizontalTitleGap: 1,
              dense: true,
              leading: Icon(Icons.person_outline_outlined, size: width / 15,),
              title: Text("Profile", style: TextStyle(fontSize: width / 22))
            ),
            ListTile
            (
              onTap: () => {},
              horizontalTitleGap: 1,
              dense: true,
              leading: Icon(Icons.settings_applications_outlined, size: width / 15,),
              title: Text("Settings", style: TextStyle(fontSize: width / 22))
            ),
            const Padding
            (
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:  Divider(color: Colors.black54, thickness: 1)
            ),
            ListTile
            (
              onTap: () async {
                showDialog(
                context: context,
                builder: (ctx) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child:PopupWidget(
                    headingText: "Logout", 
                    mainText: "Do you wish to logout?", 
                    onPressed: () {
                      loggedUserId = null;
                      loggedUsername = null;
                      loggedUserEmail = null;
                      Navigator.pushNamed(context, MyRoutes.landingRoute);
                    }, 
                    buttonText: "Yes") 
                  ),
                );
              },
              horizontalTitleGap: 1,
              dense: true,
              leading: Icon(Icons.logout_outlined, size: width / 15,),
              title: Text("Logout", style: TextStyle(fontSize: width / 22))
            ),
        ],
      ),
    );
  }
}