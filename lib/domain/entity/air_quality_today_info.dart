class AirQualityTodayInfo {
  final String region;
  final String pm10Value;
  final String pm10Status;
  final String pm25Value;
  final String pm25Status;
  final String lastUpdated;
  String status = "";
  final String so2Value;
  final String coValue;
  final String o3Value;
  final String no2Value;

  AirQualityTodayInfo({
    required this.region,
    required this.pm10Value,
    required this.pm10Status,
    required this.pm25Value,
    required this.pm25Status,
    required this.lastUpdated,
    required this.so2Value,
    required this.coValue,
    required this.o3Value,
    required this.no2Value
  });

  applyStatus(String status) {
    this.status = status;
  }
}
