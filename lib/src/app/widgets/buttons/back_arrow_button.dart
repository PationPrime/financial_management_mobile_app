library src.app.widgets.buttons.back_arrow;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../assets_gen/assets.gen.dart';
import 'bouncy_button_wrapper/bouncy_button_wrapper.dart';

class BackArrowButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackArrowButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => BouncyButtonWrapper(
        onPressed: onPressed,
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.centerLeft,
          child: Assets.icons.iconArrowBack.svg(
            colorFilter: ColorFilter.mode(
              context.color.arrowBack,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
}
