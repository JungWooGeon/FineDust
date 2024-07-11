import '../../domain/entity/weather_info.dart';
import '../../domain/repository/weather_repository.dart';
import '../mapper/weather_info_mapper.dart';
import '../service/weather_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService weatherService;

  WeatherRepositoryImpl(this.weatherService);

  @override
  Future<List<WeatherInfo>> getWeatherInfo() async {
    final response = await weatherService.getWeatherInfo();
    return response.map((json) => WeatherInfoMapper.fromJson(json)).toList();
  }
}