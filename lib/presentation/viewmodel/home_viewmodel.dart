import 'package:app_settings/app_settings.dart';
import 'package:fine_dust/presentation/model/home_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/entity/address.dart';
import '../../domain/usecase/get_address_usecase.dart';
import '../../provider/usecase_provider.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, AsyncValue<HomeData>>((ref) {
  final getAddressUsecase = ref.watch(getAddressUsecaseProvider);
  return HomeViewModel(getAddressUsecase);
});

class HomeViewModel extends StateNotifier<AsyncValue<HomeData>> {

  final GetAddressUsecase _getAddressUsecase;

  HomeViewModel(this._getAddressUsecase) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    if (await requestLocationPermission()) {
      final address = await _getAddressUsecase.execute();
      state = AsyncValue.data(HomeData(address: address));
    } else {
      Fluttertoast.showToast(msg: "위치 권한이 필요합니다. 설정에서 권한을 허용해주세요.");
      AppSettings.openAppSettings();
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

  void updateIndex(int index) {
    if (state is AsyncData<HomeData>) {
      final currentData = (state as AsyncData<HomeData>).value;
      state = AsyncValue.data(HomeData(currentIndex: index, address: currentData.address));
    }
  }
}