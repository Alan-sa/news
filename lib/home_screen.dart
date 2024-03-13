import 'package:flutter/material.dart';
import 'news/screens/news_list_screen.dart';
import 'weather/screens/weather_screen.dart';
import 'assistant/screens/chat_assistant_screen.dart';

class MyBottomTabScreen extends StatefulWidget {
  @override
  _MyBottomTabScreenState createState() => _MyBottomTabScreenState();
}

class _MyBottomTabScreenState extends State<MyBottomTabScreen> {
  int _selectedIndex = 0; // Default index of the first tab

  // List of widgets to display as body content
  final List<Widget> _widgetOptions = [
    NewsListScreen(),
    WeatherScreen(),
    ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions
            .elementAt(_selectedIndex), // Display the selected screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer_outlined),
            label: 'Support',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped, // Update the state upon tab selection
      ),
    );
  }
}
