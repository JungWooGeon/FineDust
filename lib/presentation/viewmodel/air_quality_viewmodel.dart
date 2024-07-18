import 'package:app_settings/app_settings.dart';
import 'package:fine_dust/domain/entity/address.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/usecase/get_address_usecase.dart';
import '../../domain/usecase/get_air_quality_forecasts_usecase.dart';
import '../../domain/usecase/get_air_quality_today_usecase.dart';
import '../../provider/usecase_provider.dart';
import '../model/air_quality_data.dart';

final airQualityViewModelProvider = StateNotifierProvider<AirQualityViewModel, AsyncValue<AirQualityData>>((ref) {
  final getAirQualityTodayUseCase = ref.watch(getAirQualityTodayUseCaseProvider);
  final getAirQualityForecastsUseCase = ref.watch(getAirQualityForecastsUseCaseProvider);
  final getAddressUsecase = ref.watch(getAddressUsecaseProvider);
  
  return AirQualityViewModel(getAirQualityTodayUseCase, getAirQualityForecastsUseCase, getAddressUsecase);
});

class AirQualityViewModel extends StateNotifier<AsyncValue<AirQualityData>> {
  final GetAirQualityTodayUseCase _getAirQualityTodayUseCase;
  final GetAirQualityForecastsUseCase _getAirQualityForecastsUseCase;
  final GetAddressUsecase _getAddressUsecase;

  AirQualityViewModel(this._getAirQualityTodayUseCase, this._getAirQualityForecastsUseCase, this._getAddressUsecase) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    if (await requestLocationPermission()) {
      final address = await _getAddressUsecase.execute();
      getAirQualityInfo(address);
    } else {
      Fluttertoast.showToast(msg: "위치 권한이 필요합니다. 설정에서 권한을 허용해주세요.");
      AppSettings.openAppSettings();
    }
  }

  Future<void> getAirQualityInfo(Address address) async {
    try {
      final airQualityTodayInfo = await _getAirQualityTodayUseCase.execute(address);
      final airQualityForecastsInfo = await _getAirQualityForecastsUseCase.execute(airQualityTodayInfo.region);
      state = AsyncValue.data(AirQualityData(todayInfo: airQualityTodayInfo, forecastsInfo: airQualityForecastsInfo, address: address));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<bool> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "위치 서비스를 활성화해주세요.");
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }
}
