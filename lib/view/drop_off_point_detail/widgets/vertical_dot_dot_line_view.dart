import 'package:flutter/material.dart';

class VerticalDottedLineView extends StatelessWidget {
  const VerticalDottedLineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(10, 70), // Adjust the size as per your requirements
      painter: DottedLinePainter(),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black // Change the color as needed
      ..strokeCap = StrokeCap.round // Make the line ends rounded
      ..strokeWidth = 2.0 // Adjust the line thickness as needed
      ..style = PaintingStyle.stroke;

    double spacing = 4; // Adjust the spacing between dots as needed
    double y = 0;

    while (y < size.height) {
      canvas.drawLine(Offset(size.width / 2, y),
          Offset(size.width / 2, y + spacing), paint);
      y += spacing * 2; // Adjust this value to control the gap between dots
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
