import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LottieAirQualityStatusWidget extends StatelessWidget {

  final String status;
  final double width;
  final double height;

  const LottieAirQualityStatusWidget({
    Key? key,
    required this.status,
    required this.width,
    required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: getLottieAnimation(status),
    );
  }

  Widget getLottieAnimation(String status) {
    switch (status) {
      case "매우나쁨":
        return Lottie.asset('assets/very_bad.json');
      case "매우 나쁨":
        return Lottie.asset('assets/very_bad.json');
      case "나쁨":
        return Lottie.asset('assets/bad.json');
      case "좋음":
        return Lottie.asset('assets/good.json');
      default:
        return Lottie.asset('assets/usual.json');
    }
  }
}
