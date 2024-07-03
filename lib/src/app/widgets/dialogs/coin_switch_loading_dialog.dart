library src.app.widgets.dialogs.coin_switch_loading;

import 'package:financial_management/src/app/assets_gen/assets.gen.dart';
import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:financial_management/src/app/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class CoinSwitchLoadingDialog extends LoadingDialog {
  CoinSwitchLoadingDialog({
    super.key,
  }) : super(
          boxSize: 180,
          boxColor: AppColors.transparent,
          customLoader: Lottie.asset(
            Assets.lottie.coinSwitchAnimation.path,
          ),
        );
}
