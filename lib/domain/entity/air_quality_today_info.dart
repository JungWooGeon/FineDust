class AirQualityTodayInfo {
  final String region;
  final String pm10Value;
  final String pm10Status;
  final String pm25Value;
  final String pm25Status;
  final String lastUpdated;
  String status = "";

  AirQualityTodayInfo({
    required this.region,
    required this.pm10Value,
    required this.pm10Status,
    required this.pm25Value,
    required this.pm25Status,
    required this.lastUpdated
  });

  applyStatus(String status) {
    this.status = status;
  }
}
