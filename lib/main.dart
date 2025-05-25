import 'package:flutter/material.dart';
import 'package:vibe_match/presentation/home_page.dart';
import 'package:vibe_match/presentation/widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibe Match',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomBar(),
    );
  }
}
