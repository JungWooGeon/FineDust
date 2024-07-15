import '../../domain/entity/air_quality_today_info.dart';
import '../../domain/repository/air_quality_repository.dart';
import '../mapper/air_quality_forecasts_info_mapper.dart';
import '../mapper/air_quality_today_info_mapper.dart';
import '../service/air_quality_forcasts_service.dart';
import '../service/air_quality_today_service.dart';

class AirQualityRepositoryImpl implements AirQualityRepository {
  final AirQualityTodayService airQualityTodayService;
  final AirQualityForecastsService airQualityForecastsService;

  AirQualityRepositoryImpl(this.airQualityTodayService, this.airQualityForecastsService);

  @override
  Future<List<AirQualityTodayInfo>> getAirQualityToday() async {
    final response = await airQualityTodayService.getAirQualityToday();
    return response.map((json) => AirQualityTodayInfoMapper.fromJson(json)).toList();
  }

  @override
  Future getAirQualityForecasts() async {
    final response = await airQualityForecastsService.getAirQualityForecasts();
    return response.map((json) => AirQualityForecastsInfoMapper.fromJson(json)).toList();
  }
}