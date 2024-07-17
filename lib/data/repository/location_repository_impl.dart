import 'package:fine_dust/data/service/location_service.dart';
import 'package:fine_dust/domain/entity/address.dart';
import 'package:fine_dust/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationService locationService;

  LocationRepositoryImpl(this.locationService);

  @override
  Future getAddress() async {
    final address = await locationService.getAddress();
    final administrativeArea = await locationService.getAdministrativeArea() ?? "서울특별시";

    return Address(streetAddress: address ?? "서울시 강남구", administrativeArea: administrativeArea);
  }
}