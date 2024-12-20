import 'package:flutter/material.dart';
import 'screens/note_list_screen.dart';
import 'screens/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(), // Thay đổi màn hình khởi đầu thành WelcomeScreen
    );
  }
}