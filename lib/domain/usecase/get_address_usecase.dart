import 'package:fine_dust/domain/entity/address.dart';
import 'package:fine_dust/domain/repository/location_repository.dart';

class GetAddressUsecase {
  final LocationRepository _locationRepository;

  GetAddressUsecase(this._locationRepository);

  Future<Address> execute() async {
    return await _locationRepository.getAddress();
  }
}