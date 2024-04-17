import 'package:flutter/material.dart';
import 'package:final_project/pages/games/memorygame/memory_main.dart';
import 'package:final_project/pages/games/snake/components/button.dart';
import 'package:final_project/pages/games/snake/game.dart';
import 'package:final_project/pages/games/snake/game_settings.dart';
import 'package:final_project/pages/games/snake/highs_cores.dart';
import 'package:final_project/pages/games/snake/setting_screen.dart';
import 'package:final_project/pages/games/tictactoe/tic_tac_toe_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';



class GamesSelectionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: GamesSelection(),
    );
  }
}

class SnakeGameHomePage extends StatefulWidget {
  SnakeGameHomePage({Key? key}) : super(key: key);

  @override
  _SnakeGameHomePageState createState() => _SnakeGameHomePageState();
}

class _SnakeGameHomePageState extends State<SnakeGameHomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      if (prefs.containsKey("sounds"))
        GameSettings.sounds = prefs.getBool("sounds");
      if (prefs.containsKey("controltype"))
        GameSettings.controltype = prefs.getInt("controltype");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/1.png"),
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.8), BlendMode.dstATop))),
            child: Container(
              margin: EdgeInsets.only(top: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(1),
                    child: MyButton(onPressed: (){
                        if (GameSettings.sounds == true) {
                        assetsAudioPlayer.open(Audio("assets/2.mp3"));
                        }
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp2()));
                        },
                      buttonText: "Start Game",
                      buttonColor: Colors.black,
                      textColor: Colors.grey,
                    )


                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(1),
                    child:  MyButton(onPressed: (){
                      if (GameSettings.sounds == true) {
                        assetsAudioPlayer.open(Audio("assets/2.mp3"));
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HighScoresState()));
                    },
                      buttonText: "High Scores",
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                    )


                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(1),
                    child: MyButton(onPressed: (){
                      if (GameSettings.sounds == true) {
                        assetsAudioPlayer.open(Audio("assets/2.mp3"));
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SettingScreen()));
                    },
                      buttonText: "Game Setting",
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                    ),

                      ),
                  Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(1),
                    child: MyButton(onPressed: (){
                      if (GameSettings.sounds == true) {
                        assetsAudioPlayer.open(Audio("assets/2.mp3"));
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GamesSelection()));
                    },
                      buttonText: "Exit to Game Selection",
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                    ),

                  ),

                ],
              ),
            )));
  }
}


class GamesSelection extends StatefulWidget {
  const GamesSelection({super.key});

  @override
  State<GamesSelection> createState() => _GamesSelectionState();
}

class _GamesSelectionState extends State<GamesSelection> {


  @override
  Widget build(BuildContext context) {

    List<Widget> tabdesc = [
      TabComponent(TabProperty(title:"Snake Game", onPressed: (){

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SnakeGameHomePage()));

      })),
      TabComponent(TabProperty(title: "Memory Game", onPressed: (){

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MemoryGame()));

      })),
      TabComponent(TabProperty(title: "Tic-Tac-Toe", onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TicTacToeGameScreen()));
      }))
    ];

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(

                height: 150,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(50),bottomLeft:Radius.circular(50) )
                )
                ,child:
            Center(
              child:  Text(
                  "Games Section",
                  style: GoogleFonts.poppins(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
              ),
            )
            ),
        SizedBox(height: 20,),
        Expanded(child: ListView.builder(
          itemCount: tabdesc.length,
          itemBuilder: (context, index) {
            return tabdesc[index];
          },
        ))

          ],
        ),
      ),
    );



  }

}


// properties to the tabcomponents
class TabProperty{

  String title;
  Function onPressed;
  TabProperty({required this.title,required this.onPressed});

}

Widget TabComponent(TabProperty properties){
  return Material(
      child:
      InkWell(
        onTap: () {
            properties.onPressed();
        },
        child: Container(
          height: 75,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.green.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child:Container()
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      properties.title,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
  );
}