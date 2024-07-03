part of 'background_with_circles.dart';

class CirclesPainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  const CirclesPainter({
    this.primaryColor = AppColors.mint3FB8AF,
    this.secondaryColor = AppColors.mint268A82,
  });

  void _drawPrimaryTopLeftArc(
    Canvas canvas,
    Paint paint,
  ) {
    const diameter = 290.0;
    const startAngle = 180.0;
    const sweepAngle = -180.0;

    canvas.drawArc(
      const Rect.fromLTWH(
        10,
        -(diameter * 0.75),
        diameter,
        diameter,
      ),
      TrigonometryHelper.degToRadian(startAngle),
      TrigonometryHelper.degToRadian(sweepAngle),
      false,
      paint,
    );
  }

  void _drawSecondaryTopLeftArc(
    Canvas canvas,
    Paint paint,
  ) {
    const diameter = 300.0;
    const startAngle = 0.0;
    const sweepAngle = 90.0;

    canvas.drawArc(
      const Rect.fromLTWH(
        -diameter * 0.6,
        -diameter * 0.5,
        diameter,
        diameter,
      ),
      TrigonometryHelper.degToRadian(startAngle),
      TrigonometryHelper.degToRadian(sweepAngle),
      true,
      paint,
    );
  }

  void _drawPrimaryBottomRightArc(
    Canvas canvas,
    Paint paint,
    Size size,
  ) {
    const diameter = 300.0;
    const startAngle = -180.0;
    const sweepAngle = 180.0;

    canvas.drawArc(
      Rect.fromLTWH(
        size.width - diameter * 0.9,
        size.height - diameter * 0.25,
        diameter,
        diameter,
      ),
      TrigonometryHelper.degToRadian(startAngle),
      TrigonometryHelper.degToRadian(sweepAngle),
      false,
      paint,
    );
  }

  void _drawSecondaryBottomRightArc(
    Canvas canvas,
    Paint paint,
    Size size,
  ) {
    const diameter = 250.0;
    const startAngle = -180.0;
    const sweepAngle = 90.0;

    canvas.drawArc(
      Rect.fromLTWH(
        size.width - diameter * 0.5,
        size.height - diameter * 0.5,
        diameter,
        diameter,
      ),
      TrigonometryHelper.degToRadian(startAngle),
      TrigonometryHelper.degToRadian(sweepAngle),
      true,
      paint,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final primaryPaint = Paint()..color = primaryColor;
    final secondaryPaint = Paint()..color = secondaryColor;

    _drawPrimaryTopLeftArc(
      canvas,
      primaryPaint,
    );

    _drawSecondaryTopLeftArc(
      canvas,
      secondaryPaint,
    );

    _drawSecondaryBottomRightArc(
      canvas,
      secondaryPaint,
      size,
    );

    _drawPrimaryBottomRightArc(
      canvas,
      primaryPaint,
      size,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
