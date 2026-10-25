import 'dart:math' as math;

import 'package:flutter/material.dart';

/// The stroke icons drawn on the design canvas (ui-design §3 Icons: 2 px stroke, round
/// caps), in a 24 × 24 box.
enum MonaIcon { search, grid, items, star, home, calendar, person, waveform }

class MonaIconView extends StatelessWidget {
  const MonaIconView(this.icon, {super.key, this.size = 24, this.color});

  final MonaIcon icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: CustomPaint(
      size: Size.square(size),
      painter: _IconPainter(icon, color ?? IconTheme.of(context).color ?? Colors.white),
    ),
  );
}

class _IconPainter extends CustomPainter {
  _IconPainter(this.icon, this.color);

  final MonaIcon icon;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24);
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = icon == MonaIcon.waveform ? 2.2 : 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final fill = Paint()..color = color;
    final p = Path();
    void line(double x1, double y1, double x2, double y2) => p
      ..moveTo(x1, y1)
      ..lineTo(x2, y2);
    switch (icon) {
      case MonaIcon.search:
        p.addOval(Rect.fromCircle(center: const Offset(11, 11), radius: 7));
        line(20, 20, 16.5, 16.5);
      case MonaIcon.grid:
        for (final (x, y) in [(3.0, 3.0), (14.0, 3.0), (3.0, 14.0), (14.0, 14.0)]) {
          p.addRect(Rect.fromLTWH(x, y, 7, 7));
        }
      case MonaIcon.items:
        for (final y in [6.0, 12.0, 18.0]) {
          line(9, y, 20, y);
          p
            ..moveTo(4, y)
            ..lineTo(5, y + 1)
            ..lineTo(7, y - 1);
        }
      case MonaIcon.star:
        p.addPolygon(const [
          Offset(12, 3),
          Offset(14.6, 8.5),
          Offset(20.6, 9.3),
          Offset(16.2, 13.5),
          Offset(17.3, 19.5),
          Offset(12, 16.6),
          Offset(6.7, 19.5),
          Offset(7.8, 13.5),
          Offset(3.4, 9.3),
          Offset(9.4, 8.5),
        ], true);
      case MonaIcon.home:
        canvas.drawPath(
          Path()..addPolygon(const [
            Offset(3, 11),
            Offset(12, 4),
            Offset(21, 11),
            Offset(21, 21),
            Offset(15, 21),
            Offset(15, 15),
            Offset(9, 15),
            Offset(9, 21),
            Offset(3, 21),
          ], true),
          fill,
        );
        return;
      case MonaIcon.calendar:
        p.addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(3, 5, 18, 16), const Radius.circular(2)));
        line(3, 10, 21, 10);
        line(8, 3, 8, 7);
        line(16, 3, 16, 7);
      case MonaIcon.person:
        p.addOval(Rect.fromCircle(center: const Offset(12, 8), radius: 4));
        p.addArc(Rect.fromCircle(center: const Offset(12, 21), radius: 8), math.pi, math.pi);
      case MonaIcon.waveform:
        for (final (x, y1, y2) in [
          (4.0, 10.0, 14.0),
          (8.0, 6.0, 18.0),
          (12.0, 9.0, 15.0),
          (16.0, 4.0, 20.0),
          (20.0, 10.0, 14.0),
        ]) {
          line(x, y1, x, y2);
        }
    }
    canvas.drawPath(p, stroke);
  }

  @override
  bool shouldRepaint(_IconPainter old) => old.icon != icon || old.color != color;
}
