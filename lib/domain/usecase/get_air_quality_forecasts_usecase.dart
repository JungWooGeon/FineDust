import 'package:fine_dust/domain/entity/air_quality_forecasts_info.dart';

import '../repository/air_quality_repository.dart';

class GetAirQualityForecastsUseCase {
  final AirQualityRepository _airQualityRepository;

  GetAirQualityForecastsUseCase(this._airQualityRepository);

  Future<List<AirQualityForecastsInfo>> execute(String region) async {
    return await _airQualityRepository.getAirQualityForecasts(region);
  }
}