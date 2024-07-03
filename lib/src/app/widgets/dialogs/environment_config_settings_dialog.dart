library src.app.widgets.dialogs.environment_config_settings;

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/config/environment/environment.dart';
import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/localization/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../buttons/buttons.dart';

class EnvironmentConfigSettingsDialog extends StatelessWidget {
  const EnvironmentConfigSettingsDialog({super.key});

  static Future<T?> show<T>({
    required BuildContext context,
    Color? barrierColor,
  }) async =>
      await showDialog<T>(
        context: context,
        barrierColor: barrierColor,
        builder: (_) => const EnvironmentConfigSettingsDialog(),
      );

  void _setEnvironment(
    BuildContext context,
    AppEnvironment environment,
  ) {
    AppEnvironment.instance = environment;

    log(AppEnvironment.instance.baseUrl);
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 28),
            decoration: BoxDecoration(
              color: context.color.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.app_env_settings_subtitle.tr(),
                  style: context.text.headline5Bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  title: DevelopConfig.configName,
                  onPressed: () => _setEnvironment(
                    context,
                    const DevEnvironmet(),
                  ),
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  title: StagingConfig.configName,
                  onPressed: () => _setEnvironment(
                    context,
                    const StageEnvironmet(),
                  ),
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  title: ProductionConfig.configName,
                  onPressed: () => _setEnvironment(
                    context,
                    const ProdEnvironmet(),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
