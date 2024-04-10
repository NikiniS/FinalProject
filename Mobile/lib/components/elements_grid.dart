import 'package:flutter/material.dart';
import 'package:irelax/pages/games/game_menu.dart';
import '../components/round_borders_rect.dart';
import '../pages/exersice/main.dart';
import '../pages/face_detection/camera_screen.dart';
import '../pages/face_detection/face_detecting.dart';
import '../pages/musicplayer/home_screen.dart';
class MenuElementGrid extends StatelessWidget {


  const MenuElementGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

          return Container(

            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     RoundBordersCard(importedImage: "assets/images/Cyber sport competitors.jpg",ContentText: "Lets play some\ngames to relief\nyourself",buttonColor: Colors.black,
                chipText2: "PLAY GAMES"
                ,onPressed: (){

                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) =>
                                   GamesSelectionMenu(),
                             ),
                           );

                     }),

                      RoundBordersCard(importedImage: "assets/images/weightLifting_men.jpg",ContentText: "Lets do some\nexcersices",buttonColor: Colors.black,
                          chipText2: "DO EXCERSICES"
                          ,onPressed: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ExcersiceApp(),
                              ),
                            );
                          }),

                      RoundBordersCard(importedImage: "assets/images/instument_playing.jpg",ContentText: "Lets listen some\nmind relaxing songs",buttonColor: Colors.black,
                          chipText2: "LISTEN TO SONGS"
                          ,onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>

                                    SongHomeScreen(currentExpression: CameraScreen.currentMood),
                              ),
                            );
                          }),

                      RoundBordersCard(importedImage: "assets/images/1.jpg",ContentText: "Mood changed?",buttonColor: Colors.black,
                          chipText2: "GO TO EMOTION DETECTION"
                          ,onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>

                                    FaceImageScanScreen(),
                              ),
                            );
                          }),

                    ],
                  ),

                ],
              ),
            ),
          );

  }
}

