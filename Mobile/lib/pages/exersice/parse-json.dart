import 'dart:convert';

import 'package:flutter/services.dart';
import './model/exerciseDetails.dart';

Future<String> getJsonLessons() {
  return rootBundle.loadString('assets/data/exercises.json');
}

Future<List<ExerciseDetails>> decodeExercises() async {
  return json
      .decode(await getJsonLessons())
      .map<ExerciseDetails>((json) => ExerciseDetails.fromMap(json))
      .toList();
}
