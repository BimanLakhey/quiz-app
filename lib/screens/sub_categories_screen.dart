import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/utils/routes.dart';

import '../widgets/heading_container_widget.dart';

class SubCategories {  
  SubCategories({required this.title, required this.genre});  
  final String title;  
  String genre;
  // final IconData icon;  
}  
  
List<SubCategories> subCategories = <SubCategories>[  
  SubCategories(title: 'Physics',genre: 'Science'),  
  SubCategories(title: 'Chemistry', genre: 'Science'),  
  SubCategories(title: 'Zoology', genre: 'Science'),  
  SubCategories(title: 'Botany', genre: 'Science'),  
  SubCategories(title: 'Biology', genre: 'Science'),  
  SubCategories(title: 'Astrology', genre: 'Science'),  
  SubCategories(title: 'Software development', genre: 'Computer Science'),  
  SubCategories(title: 'Programming', genre: 'Computer Science'),  
  SubCategories(title: 'Robotics', genre: 'Computer Science'),  
  SubCategories(title: 'Artificial Intelligence', genre: 'Computer Science'),  
  SubCategories(title: 'Computer Engineering', genre: 'Computer Science'), 
  SubCategories(title: 'Basic Geography', genre: 'Geography'),  
]; 


class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);
  static late String categoryGenre;
  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}


class _SubCategoriesScreenState extends State<SubCategoriesScreen> {

  List<SubCategories>? _SubCategories = null;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // _SubCategories = null;
    _SubCategories = subCategories.where((i) => i.genre == SubCategoriesScreen.categoryGenre).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var genre = SubCategoriesScreen.categoryGenre;
    print(genre);
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeadingContainerWidget(containerText: "Sub Categories", screenHeight: height, dividerHeight: 4,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:5.0),
                child: GridView.count(  
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,  
                  crossAxisSpacing: 15.0,  
                  scrollDirection: Axis.vertical,
                  children: List.generate(int.parse("${_SubCategories?.length}"), (index) {  
                    int randomColors = Random().nextInt(Colors.primaries.length);
                    return Center(  
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(MyRoutes.quizLevelRoute),
                        child: _SubCategories?[index].genre == genre ? Container(
                          height: width / 3,
                          width: width / 2.5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: Offset(width / 70, width / 50), // changes position of shadow
                              ),
                            ],
                            color: Colors.primaries[randomColors].withAlpha(230),
                            borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child: Center(
                            child: _SubCategories?[index].genre == genre ? Text("${_SubCategories?[index].title}", style: TextStyle(fontSize: width / 30),) : null,
                          ),
                        )
                        : null,
                      )  
                    );  
                  })  
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}