import 'package:fine_dust/data/service/location_service.dart';
import 'package:fine_dust/domain/entity/address.dart';
import 'package:fine_dust/domain/repository/location_repository.dart';

import '../util/location_convert_util.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationService locationService;
  final LocationConvertUtil locationConvertUtil;

  LocationRepositoryImpl(this.locationService, this.locationConvertUtil);

  @override
  Future getAddress() async {
    final address = await locationService.getAddress();
    final administrativeArea = await locationService.getAdministrativeArea() ?? "서울특별시";

    final position = await locationService.getCurrentCoordinates();

    final xyList = locationConvertUtil.convertXY(position.latitude, position.longitude);

    return Address(streetAddress: address ?? "서울시 강남구", administrativeArea: administrativeArea, x: xyList[0], y: xyList[1]);
  }
}