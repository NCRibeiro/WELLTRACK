import 'package:flutter/material.dart';
import 'package:welltrack/screens/home_screen.dart';

void main() {
  runApp(WellTrackApp());
}

class WellTrackApp extends StatelessWidget {
  const WellTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WellTrack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
