import 'dart:convert';
import 'dart:io' as Io;
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nalandaquizgame/utils/loggedUser.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Io.File? imageFile;
  var finalBytes;
  bool? edit = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   @override
  void initState() {
    nameController.text = loggedUsername.toString();
    emailController.text = loggedUserEmail.toString();
    passwordController.text = "Biman";
    super.initState();
  }  


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
        child:  SingleChildScrollView(
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: [
                    ClipPath(
                      clipper: Clipp(),
                      child: Container(
                        width: width,
                        height: height / 2.4,
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
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50,0,0,0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                child: Text("Profile", style: TextStyle(color: Colors.white, fontSize: width / 18),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(100))
                                    ),
                                    height: width / 3,
                                    width: width / 3,
                                    child: Container
                                    (
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration
                                      (
                                        boxShadow: 
                                        // ignore: prefer_const_literals_to_create_immutables
                                        [
                                          BoxShadow(color: Colors.black38, spreadRadius: 4, blurRadius:  15, offset: Offset(0, 10))
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(100.0))
                                      ),
                                      width: width / 5.2,
                                      height: width / 5.2,
                                      child: SizedBox(child: finalBytes == null ? CircularProgressIndicator() : Image.memory(finalBytes, fit: BoxFit.cover))
                                    ),
                                  ),
                                  IconButton
                                  (
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                          child: AlertDialog(
                                            content: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Container(
                                                height: width / 3, width: width / 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextButton.icon(
                                                      icon: Icon(Icons.image, color: Colors.black,),
                                                      onPressed: () async {
                                                        _getFromGallery();
                                                        
                                                      }, 
                                                      label: Text("Pick from gallery", style: TextStyle(color: Colors.black),)
                                                    ),
                                                    // SizedBox(height: 40,),
                                                    TextButton.icon(
                                                      icon: Icon(Icons.camera_alt, color: Colors.black,),
                                                      onPressed: () async {
                                                        _getFromCamera();
                                                        
                                                      }, 
                                                      label: Text("Pick from camera", style: TextStyle(color: Colors.black),)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            
                                          )
                                        )
                                      );
                                    }, 
                                    icon: Icon(Icons.camera_alt_outlined, color: Colors.white)
                                  )
                                ],
                              ),
                              SizedBox(height: width / 100,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height /  height / 1,),                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    enabled: !edit!,
                    style: TextStyle(fontSize: width / 18, fontWeight: FontWeight.bold),
                    controller: nameController, 
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",

                    ),
                  ),
                ),
                SizedBox(height: height / 25,),                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    enabled: !edit!,
                    style: TextStyle(fontSize: width / 18, fontWeight: FontWeight.bold),
                    controller: emailController, 
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                  ),
                ),
                SizedBox(height: height / 25,),                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    style: TextStyle(fontSize: width / 18, fontWeight: FontWeight.bold),
                    controller: passwordController, 
                    enabled: !edit!,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                  ),
                ),
                SizedBox(height: height / 20,),                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          edit = !edit!;
                        });
                      }, 
                      child: edit == true ? Text("Edit", style: TextStyle(fontSize: width / 20)) : Text("Save", style: TextStyle(fontSize: width / 20)),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(width / 2.5, height / 11)),
                        backgroundColor: MaterialStateProperty.all(Color(0xff042803)),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      )
    );
  }
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
      
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = Io.File(pickedFile.path);
      });
      final bytes = await Io.File(imageFile.toString()).readAsBytes();
      String base64string = base64.encode(bytes);
      Uint8List newBytes = Base64Codec().decode(base64string);
      finalBytes = newBytes;
      setState(() {
        
      });
      Navigator.pop(context);

    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = Io.File(pickedFile.path);
      });
      final bytes = await Io.File(imageFile!.path).readAsBytes();
      String base64string = base64.encode(bytes);
      Uint8List newBytes = Base64Codec().decode(base64string);
      finalBytes = newBytes;
      setState(() {
        
      });
      Navigator.pop(context);
    }
  }
}

class Clipp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - size.height / 3);
    var firstStart = Offset(size.width / 6, size.height - size.height / 3);
    var firstEnd = Offset(size.width / 3.5, size.height - size.height / 4.5);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    
    var secondStart = Offset(size.width / 2, size.height);
    var secondEnd = Offset(size.width / 1.4, size.height - size.height / 4.5);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    
    var thirdStart = Offset(size.width / 1, size.height - size.height / 2);
    var thirdEnd = Offset(size.width / 0.5, size.height);
    path.quadraticBezierTo(thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}


