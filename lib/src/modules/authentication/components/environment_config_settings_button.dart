library src.app.modules.auth.components.environment_config_settings_button;

import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/widgets/dialogs/environment_config_settings_dialog.dart';
import 'package:flutter/material.dart';

import '../../../app/localization/lang/locale_keys.g.dart';
import '../../../app/theme/app_theme.dart';
import '../../../app/widgets/widgets.dart';

class EnvironmentConfigSettingsButton extends StatelessWidget {
  const EnvironmentConfigSettingsButton({super.key});

  @override
  Widget build(BuildContext context) => PrimaryButton(
        width: 130,
        backgroundColor: AppColors.transparent,
        onPressed: () => EnvironmentConfigSettingsDialog.show(context: context),
        leftIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.settings,
            color: context.color.primary,
            size: 15,
          ),
        ),
        title: LocaleKeys.app_env_settings_title.tr(),
        titleTextStyle: context.text.headline6Bold,
      );
}
