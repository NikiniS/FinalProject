import './components/button.dart';
import 'highs_cores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'highs_cores.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game.dart';
import './game_settings.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width * .9,
                color: Colors.blue[900],
                child: MyButton(
                    textColor: Colors.white,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("sounds", !GameSettings.sounds!);
                      setState(() {
                        GameSettings.sounds = !GameSettings.sounds!;
                      });
                      if (GameSettings.sounds == true) {
                        assetsAudioPlayer.open(Audio("assets/2.mp3"));
                      }
                    },
                    buttonText: GameSettings.sounds!
                        ? "Sound On"
                        : "Sound Off"),
              ),
              Center(
                  child: Text("Controls",
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white, fontSize: 25))),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * .4,
                          color: Colors.blue[900],
                          child: MyButton(
                              textColor: Colors.white,
                              onPressed: () async {
                                if (GameSettings.sounds == true) {
                                  assetsAudioPlayer.open(Audio("assets/2.mp3"));
                                }
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt("controltype", 1);
                                GameSettings.controltype = 1;
                              },
                              buttonText: "Tap"),
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * .4,
                          color: Colors.blue[900],
                          child: MyButton(
                              textColor: Colors.white,
                              onPressed: () async {
                                if (GameSettings.sounds == true) {
                                  assetsAudioPlayer.open(Audio("assets/2.mp3"));
                                }
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt("controltype", 2);
                                GameSettings.controltype = 2;
                              },
                              buttonText: "Touch"),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * .4,
                          color: Colors.blue[900],
                          child: MyButton(
                              textColor: Colors.white,
                              onPressed: () async {
                                if (GameSettings.sounds == true) {
                                  assetsAudioPlayer.open(Audio("assets/2.mp3"));
                                }
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt("controltype", 3);
                                GameSettings.controltype = 3;
                              },
                              buttonText: "Rotate"),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Center(
                  child: Text("Color Picker",
                      style: GoogleFonts.abhayaLibre(
                          color: Colors.white, fontSize: 25))),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * .4,
                          color: GameSettings.snakeColor,
                          child: MyButton(
                              textColor: Colors.white,
                              buttonText: "Snake Color",
                              onPressed: () async {
                                if (GameSettings.sounds == true) {
                                  assetsAudioPlayer.open(Audio("assets/2.mp3"));
                                }

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Pick Color of Snake"),
                                        content: SingleChildScrollView(
                                            child: ColorPicker(
                                                onColorChanged:
                                                    (Color c) async {
                                                  setState(() {
                                                    GameSettings.snakeColor = c;
                                                  });
                                                },
                                                pickerColor:
                                                    GameSettings.snakeColor,
                                                showLabel: true,
                                                pickerAreaHeightPercent: 0.8,


                                                )),
                                                    actions: <Widget>[
      MyButton(
        buttonText: 'Got it',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
                                      );
                                    });
                              },


                        ),


                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * .4,
                          color: GameSettings.bgcolor,
                          child: MyButton(
                              textColor: Colors.white,
                              onPressed: () async {
                                if (GameSettings.sounds == true) {
                                  assetsAudioPlayer.open(Audio("assets/2.mp3"));
                                }

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Pick Color of Background"),
                                        content: SingleChildScrollView(
                                            child: ColorPicker(
                                                onColorChanged:
                                                    (Color c) async {
                                                  setState(() {
                                                    GameSettings.bgcolor = c;
                                                  });
                                                },
                                                pickerColor:
                                                    GameSettings.snakeColor,
                                                showLabel: true,
                                                pickerAreaHeightPercent: 0.8,


                                                )),
                                                    actions: <Widget>[
      MyButton(
       buttonText: 'Got it',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
                                      );
                                    });
                              },

                              buttonText: "Back Color"),
                        ),

                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * .4,
                          color: Colors.blue[900],
                          child: MyButton(
                              textColor: Colors.white,
                              onPressed: () async {
                                if (GameSettings.sounds == true) {
                                  assetsAudioPlayer.open(Audio("assets/2.mp3"));
                                }

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Non Functional "),
                                        content: SingleChildScrollView(
                                            child: ColorPicker(
                                                onColorChanged:
                                                    (Color c) async {
                                                },
                                                pickerColor:
                                                    GameSettings.snakeColor,
                                                showLabel: true,
                                                pickerAreaHeightPercent: 0.8,


                                                )),
                                                    actions: <Widget>[
                                                      MyButton(
                                           buttonText: 'Got it',
                                           onPressed: () {
                                          Navigator.of(context).pop();
                                            },
                                         ),
                                             ],
                                      );
                                    });
                              },

                              buttonText:"Non Functional"),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
