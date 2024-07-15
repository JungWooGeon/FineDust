import '../entity/air_quality_today_info.dart';
import '../repository/air_quality_repository.dart';

class GetAirQualityTodayUseCase {
  final AirQualityRepository _airQualityRepository;

  GetAirQualityTodayUseCase(this._airQualityRepository);

  Future<List<AirQualityTodayInfo>> execute() async {
    return await _airQualityRepository.getAirQualityToday();
  }
}