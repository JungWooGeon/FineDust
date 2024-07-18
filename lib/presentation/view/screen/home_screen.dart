import 'package:fine_dust/presentation/view/screen/setting_screen.dart';
import 'package:fine_dust/presentation/view/screen/weather_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'air_quality_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AirQualityScreen(title: '미세 알리미'),
    const WeatherScreen(title: '미세 알리미'),
    const SettingScreen(title: '미세 알리미')
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cloud_rounded, size: 16), label: "미세먼지"),
          BottomNavigationBarItem(icon: Icon(Icons.sunny, size: 16), label: "날씨"),
          BottomNavigationBarItem(icon: Icon(Icons.settings, size: 16), label: "설정"),
        ],
        selectedItemColor: Colors.blueAccent,
      ),
    );
  }
}