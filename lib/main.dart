import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TO DO APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 163, 194),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 13,fontStyle: FontStyle.normal),
          bodyLarge: TextStyle(fontSize: 14),
          bodyMedium: TextStyle(fontSize: 10),
          bodySmall: TextStyle(fontSize: 8),
          
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        )
      ),
      //color: const Color.fromARGB(255, 255, 152, 221),
      home: HomeScreen(),

    );
  }
}
