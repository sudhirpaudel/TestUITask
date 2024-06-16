import 'package:flutter/material.dart';
import 'package:testapp/screens/homepage.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      title: 'TestAPP',
      home: const HomeScreen(),
    );
  }
}
