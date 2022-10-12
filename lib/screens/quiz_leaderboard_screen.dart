
import 'package:flutter/material.dart';
import 'package:nalandaquizgame/widgets/user_leaderboard_widget.dart';

class QuizLeaderboardScreen extends StatelessWidget {
  const QuizLeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List profileImages = [  
      Image.asset('assets/images/users/1.jpg', fit: BoxFit.fill,),
      Image.asset('assets/images/users/2.jpg', fit: BoxFit.fill),
      Image.asset('assets/images/users/3.jpg', fit: BoxFit.fill,),
      Image.asset('assets/images/users/4.jpg', fit: BoxFit.fill,),
      Image.asset('assets/images/users/5.jpg', fit: BoxFit.fill,),
      Image.asset('assets/images/users/6.jpg', fit: BoxFit.fill,),
      Image.asset('assets/images/users/7.jpg', fit: BoxFit.fill,),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        centerTitle: true, 
        title: Text("Leaderboard", style: TextStyle(fontSize: height / 25),), 
        backgroundColor: Color(0xff354A33), 
        elevation: 0,
      ),
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
              Stack(
                children: <Widget>[
                  Container(
                    height: height / 3.2,
                    width: width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff354A33),
                          Color(0xff042803),
                        ],
                      ),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(60), bottomLeft: Radius.circular(60))
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,height / 30,0,0),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, height / 20, 0, 0),
                                child: Stack(
                                  children : [
                                    
                                    Container(
                                      height: width / 5,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(100)),
                                        border: Border.all(
                                          color: Color(0xff3DC6FC),
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        child: profileImages[1],
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius: BorderRadius.circular(100),
                                      ) 
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(width / 18,width / 6,0,0),
                                      child: Container(
                                        height: height / 20,
                                        width: height / 20,
                                        decoration: BoxDecoration(
                                          color: Color(0xff3DC6FC),
                                          borderRadius: BorderRadius.all(Radius.circular(100))
                                        ),
                                        child: Center(child: Text("2", style: TextStyle(fontSize: width / 20),),),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                              Stack(
                                children : [
                                  Container(
                                    height: width / 4,
                                    width: width / 4,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      border: Border.all(
                                        color: Color(0xffF0A227),
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      child: profileImages[0],
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: BorderRadius.circular(100),
                                    ) 
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(width / 13,width / 5,0,0),
                                    child: Container(
                                      height: height / 19,
                                      width: height / 19,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF0A227),
                                        borderRadius: BorderRadius.all(Radius.circular(100))
                                      ),
                                        child: Center(child: Text("1", style: TextStyle(fontSize: width / 17),),),
                                    ),
                                  ),
                                ]
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, height / 20, 0, 0),
                                child: Stack(
                                  children : [
                                    Container(
                                      height: width / 5,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(100)),
                                        border: Border.all(
                                          color: Color(0xff4CD6B5),
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        child: profileImages[2],
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius: BorderRadius.circular(100),
                                      ) 
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(width / 18,width / 6,0,0),
                                      child: Container(
                                        height: height / 20,
                                        width: height / 20,
                                        decoration: BoxDecoration(
                                          color: Color(0xff4CD6B5),
                                          borderRadius: BorderRadius.all(Radius.circular(100))
                                        ),
                                        child: Center(child: Text("3", style: TextStyle(fontSize: width / 20),),),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height / 20,),
                          UserLeaderboardWidget(userRank: 1, userName: "Biman Lakhey", userPoints: 50, profileImages: profileImages,),
                          SizedBox(height: height / 40,),
                          UserLeaderboardWidget(userRank: 2, userName: "Kakashi Hatake", userPoints: 30, profileImages: profileImages,),
                          SizedBox(height: height / 40,),
                          UserLeaderboardWidget(userRank: 3, userName: "Sakura Harano", userPoints: 10, profileImages: profileImages,),
                          SizedBox(height: height / 40,),
                          UserLeaderboardWidget(userRank: 4, userName: "Hashirama Senju", userPoints: 5, profileImages: profileImages,),
                          SizedBox(height: height / 40,),
                          UserLeaderboardWidget(userRank: 5, userName: "Itachi Uchiha", userPoints: 1, profileImages: profileImages,)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]
          )
        )
      )
    );
  }
}