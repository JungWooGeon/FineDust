import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/address.dart';
import '../../viewmodel/weather_viewmodel.dart';

class WeatherScreen extends ConsumerWidget {

  final String title;
  final Address address;

  const WeatherScreen({super.key, required this.title, required this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherInfoState = ref.watch(weatherViewModelProvider(address));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Text("x: ${address.x} y: ${address.y}")
    );
  }
}