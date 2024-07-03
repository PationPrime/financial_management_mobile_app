library src.app.tools.trigonometry_helper;

import 'dart:math' as math;

abstract final class TrigonometryHelper {
  static double degToRadian(double degree) {
    return math.pi / 180 * degree;
  }
}
