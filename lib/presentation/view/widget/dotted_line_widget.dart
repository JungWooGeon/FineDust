import 'package:flutter/cupertino.dart';

import 'dashed_line_painter_widget.dart';

class DottedLineWidget extends StatelessWidget {

  const DottedLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SizedBox(
        width: double.infinity,
        height: 1, // 점선의 높이
        child: CustomPaint(
          painter: DashedLinePainter(),
        ),
      ),
    );
  }
}
