import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        cardColor: Colors.blue,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue),
        useMaterial3: true,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue
        )
      ),
      home: const MyHomePage(),
    );
  }
}
