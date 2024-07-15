import 'package:fine_dust/data/service/location_service.dart';
import 'package:fine_dust/domain/entity/address.dart';
import 'package:fine_dust/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationService locationService;

  LocationRepositoryImpl(this.locationService);

  @override
  Future getAddress() async {
    final locality = await locationService.getLocality() ?? "서울";
    final address = await locationService.getAddress() ?? locality;

    return Address(streetAddress: address, locality: locality);
  }
}