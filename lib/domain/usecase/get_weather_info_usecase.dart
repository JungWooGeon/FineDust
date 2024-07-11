import '../entity/weather_info.dart';
import '../repository/weather_repository.dart';

class GetWeatherInfoUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherInfoUseCase(this._weatherRepository);

  Future<List<WeatherInfo>> execute() async {
    return await _weatherRepository.getWeatherInfo();
  }
}