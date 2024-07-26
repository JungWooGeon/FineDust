import 'package:fine_dust/data/mapper/database_mapper.dart';
import 'package:fine_dust/data/service/databse_service.dart';
import 'package:fine_dust/data/service/weather_forecasts_service.dart';
import 'package:fine_dust/domain/repository/weather_forecasts_repository.dart';

import '../../domain/entity/address.dart';
import '../../domain/entity/forecast_date.dart';
import '../mapper/weather_forecasts_short_term_info_mapper.dart';
import '../service/date_time_service.dart';
import '../service/local_storage_service.dart';
import '../util/date_time_util.dart';

class WeatherForecastsRepositoryImpl extends WeatherForecastsRepository {
  final WeatherForecastsService weatherForecastsService;
  final DateTimeService dateTimeService;
  final LocalStorageService localStorageService;
  final DatabaseService databaseService;
  final DateTimeUtil dateTimeUtil;

  WeatherForecastsRepositoryImpl(this.weatherForecastsService, this.dateTimeService, this.localStorageService, this.databaseService, this.dateTimeUtil);

  @override
  Future<List<ForecastDate>> getWeatherForecastsShortTerm(Address address) async {
    // 최근 업데이트 시간 조회
    final lastUpdateDateTime = await localStorageService.getLastUpdateDateTime();
    final updateTimeFromCurrentTime = dateTimeService.getUpdateTimeFromCurrentTime();

    if (lastUpdateDateTime == null || dateTimeUtil.isFirstDateEarlier(lastUpdateDateTime, updateTimeFromCurrentTime)) {
      // rest api 조회
      String baseDateTime = dateTimeService.getCurrentDateTimeFormatted('yyyyMMdd');
      String nx = address.x;
      String ny = address.y;

      final response = await weatherForecastsService.getWeatherForecastsShortTerm(baseDateTime, nx, ny);
      final weatherForecastsShortTermForecasts =  WeatherForecastsShortTermInfoMapper.fromJson(response);
      final forecastDateList = DatabaseMapper.mapForecastShortTermToDbFormat(weatherForecastsShortTermForecasts.forecasts);

      // Sqlite DB 업데이트 - 날씨 데이터 백업
      await databaseService.clearForecasts();
      await databaseService.insertForecasts(forecastDateList);

      // SharedPrefernces 업데이트 - 최근 업데이트 날짜 시간 백업
      final dateTimeNow = dateTimeService.getCurrentDateTimeFormatted('yyyy-MM-dd HH:mm:ss');
      await localStorageService.setLastUpdateDateTime(dateTimeNow);

      return forecastDateList;
    } else {
      // 기존 Sqlite 조회
      final forecastDateList = databaseService.getAllForecasts();
      return forecastDateList;
    }
  }

  @override
  Future getWeatherForecastsMidTerm() {
    // TODO: implement getWeatherForecastsMidTerm
    throw UnimplementedError();
  }
}