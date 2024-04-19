import 'package:flutter/material.dart';
import './screens/custom-exercise/custom-exercise-action.dart';
import './screens/custom-exercise/custom-exercise.dart';
import './screens/exercise/congratulation-page.dart';
import './screens/exercise/exercise-main.dart';
import './screens/exercises.dart';
import './screens/history.dart';
import './screens/promotions.dart';
import './screens/settings.dart';
import './screens/statistics.dart';
import './screens/try-premium.dart';
import './screens/welcome/welcome.dart';


class ExcersiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      title: "Timer App",
      initialRoute: WelcomePage.id,
      routes: <String, WidgetBuilder>{
        "/welcome": (BuildContext context) => new WelcomePage(),
        "/exercises": (BuildContext context) => new Exercises(),
        "/custom-exercise": (BuildContext context) => new CustomExercise(),
        "/custom-exercise-action": (BuildContext context) =>
            new CustomExerciseAction(),
        "/history": (BuildContext context) => new History(),
        "/settings": (BuildContext context) => new Settings(),
        "/statistics": (BuildContext context) => new Statistics(),
        "/promotions": (BuildContext context) => new Promotions(),
        "/exercise-main": (BuildContext context) => new ExerciseMain(),
        "/congratulation-page": (BuildContext context) =>
            new CongratulationPage(),
        "/try-premium": (BuildContext context) => new TryPremium(),
      },
    );
  }
}
