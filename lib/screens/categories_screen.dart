import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nalandaquizgame/screens/sub_categories_screen.dart';
import '../utils/routes.dart';
import '../widgets/heading_container_widget.dart';

class Categories {  
  const Categories({required this.title});  
  final String title;  
  // final IconData icon;  
}  
  
const List<Categories> categories = const <Categories>[  
  const Categories(title: 'Science'),  
  const Categories(title: 'Computer Science'),  
  const Categories(title: 'Geography'),  
  const Categories(title: 'History'),  
  const Categories(title: 'Mathematics'),  
  const Categories(title: 'General Knowledge'),  
  const Categories(title: 'Political Science'),  
  const Categories(title: 'Animal Kingdom'),  
  const Categories(title: 'Plant Kingdom'),  

]; 

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
              HeadingContainerWidget(containerText: "Categories", screenHeight: height, dividerHeight: 4,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:5.0),
                child: GridView.count(  
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,  
                  crossAxisSpacing: 15.0,  
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories.length, (index) {  
                    int randomColors = Random().nextInt(Colors.primaries.length);
                    return Center(  
                      child: GestureDetector(
                        onTap: () { 
                          SubCategoriesScreen.categoryGenre = categories[index].title;
                          Navigator.of(context).pushNamed(MyRoutes.subCategoriesRoute);
                        },
                        child: Container(
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
                            child: Text(categories[index].title, style: TextStyle(fontSize: width / 25,)),
                          ),
                        ),
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