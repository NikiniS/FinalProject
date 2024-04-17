import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/loading_page.dart';
import 'theme/app_theme.dart';
import 'managers/game_manager.dart';
import 'models/word.dart';
import 'package:provider/provider.dart';
import 'pages/error_page.dart';
import 'pages/game_page.dart';

List<Word> sourceWords = [];

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<MemoryGame> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _initializeGame();
  }
}


Widget _initializeGame() {

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  populateSourceWords();

    return MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Game',
      theme: appTheme,
      home: Material(
          child: ChangeNotifierProvider(
              create: (_) => GameManager(), child: const GamePage())),
    );
  }
}

int populateSourceWords() {


  sourceWords.add(Word(
      text: "1",
      url: "https://cdn3.vectorstock.com/i/1000x1000/46/72/question-mark-icon-in-round-black-background-vector-45414672.jpg",
      displayText: true));
  sourceWords.add(Word(
      text: "2",
      url: "https://cdn3.vectorstock.com/i/1000x1000/46/72/question-mark-icon-in-round-black-background-vector-45414672.jpg",
      displayText: true));
  sourceWords.add(Word(
      text: "3",
      url: "https://cdn3.vectorstock.com/i/1000x1000/46/72/question-mark-icon-in-round-black-background-vector-45414672.jpg",
      displayText: true));
  sourceWords.add(Word(
      text: "4",
      url: "https://cdn3.vectorstock.com/i/1000x1000/46/72/question-mark-icon-in-round-black-background-vector-45414672.jpg",
      displayText: true));
  sourceWords.add(Word(
      text: "5",
      url: "https://cdn3.vectorstock.com/i/1000x1000/46/72/question-mark-icon-in-round-black-background-vector-45414672.jpg",
      displayText: true));
  sourceWords.add(Word(
      text: "8",
      url: "https://cdn3.vectorstock.com/i/1000x1000/46/72/question-mark-icon-in-round-black-background-vector-45414672.jpg",
      displayText: true));

  return 1;
}
