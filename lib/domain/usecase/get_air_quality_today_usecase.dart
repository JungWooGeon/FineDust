import '../entity/address.dart';
import '../entity/air_quality_today_info.dart';
import '../repository/air_quality_repository.dart';

class GetAirQualityTodayUseCase {
  final AirQualityRepository _airQualityRepository;

  GetAirQualityTodayUseCase(this._airQualityRepository);

  Future<AirQualityTodayInfo> execute(Address address) async {
    return await _airQualityRepository.getAirQualityToday(address);
  }
}