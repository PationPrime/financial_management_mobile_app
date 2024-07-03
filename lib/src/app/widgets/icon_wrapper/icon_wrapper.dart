library src.app.widgets.icon_wrapper;

import 'package:flutter/material.dart';

abstract class IconWrapper extends StatelessWidget {
  final Color? color;

  const IconWrapper({
    super.key,
    this.color,
  });

  IconWrapper copyWith({
    Color? color,
  });
}
