import 'package:flutter/material.dart';
import 'package:tabbar_with_button/widget/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Tab Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'IBMPlexSans',
        scaffoldBackgroundColor: const Color(0xFFE9E9EA),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1C1C1E)),
      ),
      home: HomePage(),
    );
  }
}
