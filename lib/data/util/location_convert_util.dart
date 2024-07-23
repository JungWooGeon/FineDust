import 'dart:math' as math;

class LocationConvertUtil {

  // Private constructor to ensure singleton instance
  LocationConvertUtil._privateConstructor();

  // Singleton instance
  static final LocationConvertUtil instance = LocationConvertUtil._privateConstructor();

  List<String> convertXY(double latitude, double longitude) {
    double RE = 6371.00877;  // 지구 반경(km)
    double GRID = 5.0;  // 격자 간격(km)
    double SLAT1 = 30.0;  // 투영 위도1(degree)
    double SLAT2 = 60.0;  // 투영 위도2(degree)
    double OLON = 126.0;  // 기준점 경도(degree)
    double OLAT = 38.0;  // 기준점 위도(degree)
    double XO = 43.0;  // 기준점 X좌표(GRID)
    double YO = 136.0;  // 기준점 Y좌표(GRID)
    double DEGRAD = math.pi / 180.0;

    double re = RE / GRID;
    double slat1 = SLAT1 * DEGRAD;
    double slat2 = SLAT2 * DEGRAD;
    double olon = OLON * DEGRAD;
    double olat = OLAT * DEGRAD;

    double sn = math.tan(math.pi * 0.25 + slat2 * 0.5) / math.tan(math.pi * 0.25 + slat1 * 0.5);
    sn = math.log(math.cos(slat1) / math.cos(slat2)) / math.log(sn);
    double sf = math.tan(math.pi * 0.25 + slat1 * 0.5);
    sf = math.pow(sf, sn) * math.cos(slat1) / sn;
    double ro = math.tan(math.pi * 0.25 + olat * 0.5);
    ro = re * sf / math.pow(ro, sn);

    double ra = math.tan(math.pi * 0.25 + latitude * DEGRAD * 0.5);
    ra = re * sf / math.pow(ra, sn);
    double theta = longitude * DEGRAD - olon;
    if (theta > math.pi) {
      theta -= 2.0 * math.pi;
    }
    if (theta < -math.pi) {
      theta += 2.0 * math.pi;
    }
    theta *= sn;

    int x = (ra * math.sin(theta) + XO + 0.5).toInt();
    int y = (ro - ra * math.cos(theta) + YO + 0.5).toInt();

    return [x.toString(), y.toString()];
  }
}