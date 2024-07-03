library src.app.router.app_router;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';
import 'navigator_key_provider.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
  }) : super(
          navigatorKey: NavigatorKeyProvider.instance,
        );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootWrapperRouter.page,
          children: [
            AutoRoute(
              path: 'authentication',
              page: AuthWrapperRouter.page,
              children: [
                AutoRoute(
                  path: '',
                  page: LoginRoute.page,
                ),
                AutoRoute(
                  path: 'sign-up',
                  page: SignUpRoute.page,
                ),
                AutoRoute(
                  path: 'reset-password',
                  page: ResetPasswordRoute.page,
                ),
                RedirectRoute(
                  path: '*',
                  redirectTo: '',
                ),
              ],
            ),
            AutoRoute(
              path: 'app-loading-page',
              page: LoadingWrapperRouter.page,
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
              children: [
                AutoRoute(
                  path: 'settings',
                  page: SettingsRoute.page,
                ),
                RedirectRoute(
                  path: '*',
                  redirectTo: '',
                ),
              ],
            ),
            AutoRoute(
              page: MainWrapperRouter.page,
              path: 'main',
              children: [
                AutoRoute(
                  path: 'tabbar',
                  page: HomeStackRoute.page,
                  initial: true,
                  children: [
                    AutoRoute(
                      path: 'activities-feed',
                      page: ActivitiesFeedRoute.page,
                    ),
                    AutoRoute(
                      path: 'dashboard',
                      page: DashboardRoute.page,
                    ),
                    RedirectRoute(
                      path: '*',
                      redirectTo: '',
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ];
}
