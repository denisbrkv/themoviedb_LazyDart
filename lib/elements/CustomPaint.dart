import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintWidget extends StatefulWidget {
  CustomPaintWidget({Key? key}) : super(key: key);

  @override
  State<CustomPaintWidget> createState() => _CustomPaintWidgetState();
}

class _CustomPaintWidgetState extends State<CustomPaintWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: RadialPercentWidget(
            percent: 0.72,
            fillColor: Colors.blue,
            lineColor: Colors.red,
            freeColor: Colors.grey,
            lineWidht: 5,
            child: Text(
              '72%',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidht;
  const RadialPercentWidget(
      {Key? key,
      required this.child,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidht})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
            painter: MyPainter(
          percent: percent,
          fillColor: fillColor,
          freeColor: freeColor,
          lineColor: lineColor,
          lineWidht: lineWidht,
        )),
        Center(child: child),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidht;

  MyPainter(
      {required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidht});
  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFillArc(canvas, arcRect);
  }

  void drawFillArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidht;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, 0 - pi / 2, pi * 2 * percent, false, paint);
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidht;
    canvas.drawArc(arcRect, pi * 2 * percent - (pi / 2), pi * 2 * (1 - percent),
        false, paint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    final linesMargin = 3;
    final offset = lineWidht / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
