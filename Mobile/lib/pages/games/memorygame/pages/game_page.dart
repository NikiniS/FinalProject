import 'package:flutter/material.dart';
import 'package:final_project/pages/games/game_menu.dart';
import '../animation/confetti_animation.dart';
import '../managers/game_manager.dart';
import '../memory_main.dart';
import '../components/replay_popup.dart';
import '../models/word.dart';
import '../components/word_tile.dart';
import 'package:provider/provider.dart';
import 'error_page.dart';
import 'loading_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final _futureCachedImages;
  List<Word> _gridWords = [];

  @override
  void initState() {
    _futureCachedImages = _cacheImages();
    _setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.10;
    return FutureBuilder(
      future: _futureCachedImages,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorPage();
        }
        if (snapshot.hasData) {
          return Selector<GameManager, bool>(
            selector: (_, gameManager) => gameManager.roundCompleted,
            builder: (_, roundCompleted, __) {
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) async {
                  if (roundCompleted) {
                    await showDialog(
                        barrierColor: Colors.transparent,
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const ReplayPopUp());
                  }
                },
              );

              return Stack(
                children: [
                  Positioned(
                      left: 0,
                      top: 0,
                      child:Opacity(
                    opacity: 0.3,
                    child:  IconButton(
                      onPressed: () {
                        // Handle button press
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => GamesSelection()));
                      },
                      color: Colors.blue, // Change icon color if needed
                      icon: Icon(Icons.backspace), // Set the icon
                    )
                  )),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/Cloud.png'))),
                  ),
                  SafeArea(
                    child: Center(
                      child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              left: widthPadding, right: widthPadding),
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: size.height * 0.38),
                          itemBuilder: (context, index) => WordTile(
                                index: index,
                                word: _gridWords[index],
                              )),
                    ),
                  ),
                  ConfettiAnimation(animate: roundCompleted)
                ],
              );
            },
          );
        } else {
          return const LoadingPage();
        }
      },
    );
  }

  _setUp() {
    sourceWords.shuffle();
    for (int i = 0; i < 3; i++) {
      _gridWords.add(sourceWords[i]);
      _gridWords.add(Word(
          text: sourceWords[i].text,
          url: sourceWords[i].url,
          displayText: true));
    }
    _gridWords.shuffle();
  }

  Future<int> _cacheImages() async {
    for (var w in _gridWords) {
      final image = Image.network(w.url);
      await precacheImage(image.image, context);
    }

    return 1;
  }
}
