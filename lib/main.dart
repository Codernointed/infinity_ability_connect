import 'package:flutter/material.dart';
import 'package:infinty_ability_connect/emergency_articles_screen.dart';
import 'text_to_sign_language_converter_screen.dart';
import 'sign_language_game_screen.dart';
import 'aac_software_screen.dart';
// import 'emergency_articles_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 207, 158, 11), // Gold
        scaffoldBackgroundColor: Colors.white, // Dominant White
        textTheme: const TextTheme(
          // Set the text color to black for all Text widgets
          bodyLarge: TextStyle(color: Colors.black),
          // You can add more text styles as needed
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 207, 158, 11), // Gold
          textTheme: ButtonTextTheme.primary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.amber, // Gold
          selectedItemColor: Color.fromARGB(255, 249, 207, 88), // Gold
          unselectedItemColor: Colors.black, // Black
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    TextToSignLanguageConverterScreen(),
    SignLanguageGameScreen(),
    AACSoftwareScreen(),
    EmergencyArticlesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            label: 'Converter',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Game',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'AAC',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
        ],
      ),
    );
  }
}
