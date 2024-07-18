import '../../domain/entity/address.dart';
import '../../domain/entity/air_quality_forecasts_info.dart';
import '../../domain/entity/air_quality_today_info.dart';
import '../../domain/repository/air_quality_repository.dart';
import '../mapper/air_quality_forecasts_info_mapper.dart';
import '../mapper/air_quality_today_info_mapper.dart';
import '../service/air_quality_forcasts_service.dart';
import '../service/air_quality_today_service.dart';
import '../util/air_quality_util.dart';

class AirQualityRepositoryImpl implements AirQualityRepository {
  final AirQualityTodayService airQualityTodayService;
  final AirQualityForecastsService airQualityForecastsService;
  final AirQualityUtil airQualityUtil;

  AirQualityRepositoryImpl(this.airQualityTodayService, this.airQualityForecastsService, this.airQualityUtil);

  @override
  Future<AirQualityTodayInfo> getAirQualityToday(Address address) async {
    final response = await airQualityTodayService.getAirQualityToday();
    final airQualityTodayList =  response.map((json) => AirQualityTodayInfoMapper.fromJson(json)).toList();

    // 전체 오늘 미세먼지 내용 중 현재 지역 내용 추출
    final airQualityToday = airQualityUtil.extractTodayAirQualityFromAddress(airQualityTodayList, address);

    // 미세먼지와 초미세먼지 농도 중 낮은 상황 추출 후 적용
    final status = airQualityUtil.extractAirQualityStatusFromAirQualityToday(airQualityToday);
    airQualityToday.applyStatus(status);

    return airQualityToday;
  }

  @override
  Future<List<AirQualityForecastsInfo>> getAirQualityForecasts(String region) async {
    final response = await airQualityForecastsService.getAirQualityForecasts();
    final airQualityForecastList = response.map((json) => AirQualityForecastsInfoMapper.fromJson(json)).toList();

    // 전체 미세먼지 예보 내용 중 현재 지역 내용 추출
    final resultForecastList = airQualityUtil.extractForecastAirQualityFromRegion(airQualityForecastList, region);

    return resultForecastList;
  }
}