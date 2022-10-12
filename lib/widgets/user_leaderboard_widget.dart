import 'package:flutter/material.dart';

class UserLeaderboardWidget extends StatelessWidget {
  final int userRank;
  final String userName;
  final profileImages;
  final int userPoints;

  UserLeaderboardWidget({required this.userRank, this.profileImages, required this.userName, required this.userPoints});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 5,
      width: width / 1.2,
      decoration: userRank == 1 || userRank == 2 || userRank == 3 ? BoxDecoration(
        color: userRank == 1 
        ? Color(0xffF0A227) : userRank == 2 
        ? Color(0xff3DC6FC) : userRank == 3 
        ?Color(0xff4CD6B5) : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ) : BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$userRank", style: TextStyle(color: userRank == 1 || userRank == 2 || userRank == 3 ? Colors.white : Colors.black, fontSize: width / 14),),
            Container(
              height: width / 7,
              width: width / 7,
              child: ClipRRect(
                child: profileImages[userRank-1],
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(100),
              ) 
            ),
            SizedBox( width: width / 3, child: Text("$userName", style: TextStyle(color: userRank == 1 || userRank == 2 || userRank == 3 ? Colors.white : Colors.black, fontSize: width / 20),)),
            SizedBox( width: width / 10,child: Text("$userPoints pts", style: TextStyle(color: userRank == 1 || userRank == 2 || userRank == 3 ? Colors.white : Colors.black, fontSize: width / 25),)),
          ],
        ),
      ),
    );
  }
}