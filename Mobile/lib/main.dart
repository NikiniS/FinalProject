import 'package:flutter/material.dart';
//import 'package:final_project/pages/exersice/model/remindTime.dart';
//import 'package:final_project/pages/exersice/model/savedData.dart';
import 'package:final_project/pages/registration/login.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();
  //Hive.registerAdapter(SavedDataAdapter());
  //Hive.registerAdapter(RemindTimeAdapter());
  await Hive.openBox('savedData');
  await Hive.openBox('settings');
  await Hive.openBox('timeReminded');
  if (Hive.box('settings').get('soundType') == null) {
    Hive.box('settings').put('soundType', 1);
  }
  if (Hive.box('settings').get('isPaused') == null) {
    Hive.box('settings').put('isPaused', true);
  }

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LoginBodyScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

