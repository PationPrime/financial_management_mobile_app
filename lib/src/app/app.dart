library src.app;

import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/api_client/client.dart';
import 'package:financial_management/src/app/localization/lang/locale_keys.g.dart';
import 'package:financial_management/src/app/localization/localization.dart';
import 'package:financial_management/src/app/repositories/repositories.dart';
import 'package:financial_management/src/app/repositories/test_repo/test_repo.dart';
import 'package:financial_management/src/app/repositories/test_repo/test_repo_interface.dart';
import 'package:financial_management/src/app/router/router.dart';
import 'package:financial_management/src/app/shared_controllers/authorization_controller/authorization_controller.dart';
import 'package:financial_management/src/app/shared_controllers/tests_controller/tests_controller.dart';
import 'package:financial_management/src/app/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared_controllers/theme_controller/app_theme_controller.dart';
import 'theme/app_theme.dart';

class FinancialManagementAppRoot extends StatefulWidget {
  final AppRouter router;
  final ConcreteApiClient apiClient;

  const FinancialManagementAppRoot({
    super.key,
    required this.router,
    required this.apiClient,
  });

  @override
  State<FinancialManagementAppRoot> createState() =>
      _FinancialManagementAppRootState();
}

class _FinancialManagementAppRootState
    extends State<FinancialManagementAppRoot> {
  ///
  late final Map<String, BaseRepositoryInterface> _repositories = {
    "v1_authentication": V1AuthenticationRepository(widget.apiClient),
    "test_repo": TestRepo(widget.apiClient),
  };

  final _hiveLocalStorage = HiveStorage.instance;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<TestRepoInterface>(
              create: (_) => _repositories['test_repo'] as TestRepo,
            ),
            RepositoryProvider<AuthenticationRepositoryInterface>(
              create: (_) => _repositories['v1_authentication']
                  as V1AuthenticationRepository,
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthorizationController>(
                create: (context) => AuthorizationController(
                  _hiveLocalStorage,
                ),
              ),
              BlocProvider<TestsController>(
                create: (context) => TestsController(
                  context.read<TestRepoInterface>(),
                ),
              ),
              BlocProvider<AppThemeController>(
                create: (_) => AppThemeController(),
              ),
            ],
            child: BlocBuilder<AppThemeController, AppThemeState>(
              builder: (context, appThemeState) => AppThemeConfig(
                type: appThemeState.themeType,
                child: AppLocalization(
                  builder: (BuildContext context) => MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    locale: context.locale,
                    supportedLocales: context.supportedLocales,
                    localizationsDelegates: context.localizationDelegates,
                    title: LocaleKeys.app_title.tr(),
                    theme: AppTheme.of(context),
                    darkTheme: AppThemeData.darkTheme,
                    routerConfig: widget.router.config(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
