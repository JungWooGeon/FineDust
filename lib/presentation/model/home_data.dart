import '../../domain/entity/address.dart';

class HomeData {
  final int currentIndex;
  final Address address;

  HomeData({this.currentIndex = 0, required this.address});
}