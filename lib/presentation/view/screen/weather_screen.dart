import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/address.dart';

class WeatherScreen extends StatelessWidget {

  final String title;
  final Address address;

  const WeatherScreen({super.key, required this.title, required this.address});

  @override
  Widget build(BuildContext context) {
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