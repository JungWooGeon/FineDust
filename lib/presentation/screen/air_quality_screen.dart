import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/air_quality_viewmodel.dart';

class AirQualityScreen extends ConsumerWidget {

  final String title;

  const AirQualityScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airQualityInfoState = ref.watch(airQualityViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        centerTitle: true, // AppBar의 제목을 가운데 정렬
      ),
      body: airQualityInfoState.when(
        data: (airQualityData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 24,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      airQualityData.address.streetAddress,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}