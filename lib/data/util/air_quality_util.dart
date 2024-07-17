import '../../domain/entity/address.dart';
import '../../domain/entity/air_quality_today_info.dart';

class AirQualityUtil {
  // Private constructor to ensure singleton instance
  AirQualityUtil._privateConstructor();

  // Singleton instance
  static final AirQualityUtil instance = AirQualityUtil._privateConstructor();

  String extractAirQualityStatusFromAirQualityToday(AirQualityTodayInfo airQualityTodayInfo) {
    final pm10Value = double.parse(airQualityTodayInfo.pm10Value);
    final pm25Value = double.parse(airQualityTodayInfo.pm25Value);

    if (pm10Value >= pm25Value) {
      return airQualityTodayInfo.pm10Status;
    } else {
      return airQualityTodayInfo.pm25Status;
    }
  }

  AirQualityTodayInfo extractTodayAirQualityFromAddress(List<AirQualityTodayInfo> airQualityTodayList, Address address) {
    final region = extractRegionFromAdministrativeArea(address.administrativeArea);

    var result;
    var nullResult;

    airQualityTodayList.forEach((airQuality) {
      if (region == airQuality.region) {
        result = airQuality;
        return;
      }

      if ("서울" == airQuality.region) {
        nullResult = airQuality;
      }
    });

    if (result == null) {
      return nullResult;
    } else {
      return result;
    }
  }

  String extractRegionFromAdministrativeArea(String administrativeArea) {
    // 경기도, 강원도, 충청남도, 전라북도, 경상북도, 충청북도, 경상남도, 전라남도
    // 특별시, 광역시, 특별자치시(도)
    switch(administrativeArea) {
      case "경기도":
        return "경기";
      case "강원도":
        return "강원";
      case "충청남도":
        return "충남";
      case "전라북도":
        return "전북";
      case "경상북도":
        return "경북";
      case "충청북도":
        return "충북";
      case "경상남도":
        return "경남";
      case "전라남도":
        return "전남";
      case "서울특별시":
        return "서울";
      case "부산광역시":
        return "부산";
      case "인천광역시":
        return "인천";
      case "세종특별자치시":
        return "세종";
      case "울산광역시":
        return "울산";
      case "제주특별자치도":
        return "제주";
      case "대구광역시":
        return "대구";
      case "대전광역시":
        return "대전";
      case "광주광역시":
        return "광주";
      default:
        return "서울";
    }
  }
}