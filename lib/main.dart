import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mood_diary/features/mood/presentation/pages/mood_diary_home_screen.dart';

void main() async {
  await initializeDateFormatting('ru', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MoodDiaryHomeScreen() //MoodDiaryHomeScreen(),
        );
  }
}
