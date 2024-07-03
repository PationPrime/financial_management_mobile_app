library src.app.module;

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/api_client/client.dart';
import 'package:financial_management/src/app/app.dart';
import 'package:financial_management/src/app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../router/router.dart';
import '../tools/tools.dart';

final class AppModule {
  const AppModule._();

  static const _instance = AppModule._();

  factory AppModule.singleton() => _instance;

  static final _appRouter = AppRouterProvider.instance;

  static const _appLogger = AppLogger(where: 'AppModule');

  Future<void> init() async {
    await runZonedGuarded(
      () async {
        await _configureDependencies();

        runApp(
          FinancialManagementAppRoot(
            router: _appRouter,
            apiClient: ConcreteApiClient.singleton(),
          ),
        );
      },
      (error, stack) => _appLogger.logError(
        "$error",
        lexicalScope: "init()",
        stackTrace: stack,
      ),
    );
  }

  Future<void> _configureDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await _setUpHive();
  }

  Future<void> _setUpHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TokenModelAdapter());
  }
}
