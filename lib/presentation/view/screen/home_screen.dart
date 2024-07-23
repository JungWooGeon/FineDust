import 'package:fine_dust/presentation/view/screen/setting_screen.dart';
import 'package:fine_dust/presentation/view/screen/weather_screen.dart';
import 'package:fine_dust/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'air_quality_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeDataAsyncValue = ref.watch(homeViewModelProvider);

    return homeDataAsyncValue.when(
      data: (homeData) {
        final currentIndex = homeData.currentIndex;
        final address = homeData.address;

        final List<Widget> screens = [
          AirQualityScreen(title: '미세 알리미', address: address),
          WeatherScreen(title: '미세 알리미', address: address),
          const SettingScreen(title: '설정')
        ];

        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              ref.read(homeViewModelProvider.notifier).updateIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.cloud_rounded), label: "미세먼지"),
              BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "날씨"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
            ],
            selectedItemColor: Colors.blueAccent,
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}