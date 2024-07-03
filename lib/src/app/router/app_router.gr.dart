// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:financial_management/src/app/router/authentication_wrapper_route.dart'
    as _i4;
import 'package:financial_management/src/app/router/home_stack.dart' as _i6;
import 'package:financial_management/src/app/router/loading_wrapper_route.dart'
    as _i7;
import 'package:financial_management/src/app/router/main_wrapper_route.dart'
    as _i9;
import 'package:financial_management/src/app/router/root_wrapper_route.dart'
    as _i14;
import 'package:financial_management/src/modules/activities/screens/activities_feed/activities_feed_screen.dart'
    as _i1;
import 'package:financial_management/src/modules/activities/screens/activities_overview/activities_overview_screen.dart'
    as _i2;
import 'package:financial_management/src/modules/activities/screens/activity_details/activity_details_screen.dart'
    as _i3;
import 'package:financial_management/src/modules/authentication/screens/login/login_screen.dart'
    as _i8;
import 'package:financial_management/src/modules/authentication/screens/reset_password/reset_password_screen.dart'
    as _i13;
import 'package:financial_management/src/modules/authentication/screens/sign_up/sign_up_screen.dart'
    as _i16;
import 'package:financial_management/src/modules/dashboard/screens/dashboard/dashboard_screen.dart'
    as _i5;
import 'package:financial_management/src/modules/notifications/screens/notification_details/notification_details_screen.dart'
    as _i10;
import 'package:financial_management/src/modules/notifications/screens/notifications/notifications_screen.dart'
    as _i11;
import 'package:financial_management/src/modules/profile/screens/profile/profile_screen.dart'
    as _i12;
import 'package:financial_management/src/modules/profile/screens/settings/settings_screen.dart'
    as _i15;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    ActivitiesFeedRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i1.ActivitiesFeedScreen()),
      );
    },
    ActivitiesOverviewRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i2.ActivitiesOverviewScreen()),
      );
    },
    ActivityDetailsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i3.ActivityDetailsScreen()),
      );
    },
    AuthWrapperRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthenticationWrapperRouterPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i5.DashboardScreen()),
      );
    },
    HomeStackRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeStackScreen(),
      );
    },
    LoadingWrapperRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoadingWrapperRouterPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i8.LoginScreen()),
      );
    },
    MainWrapperRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MainWrapperRouterPage(),
      );
    },
    NotificationDetailsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i10.NotificationDetailsScreen()),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i11.NotificationsScreen()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i12.ProfileScreen()),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i13.ResetPasswordScreen()),
      );
    },
    RootWrapperRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.RootWrapperRouterPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i15.SettingsScreen()),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i16.SignUpScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.ActivitiesFeedScreen]
class ActivitiesFeedRoute extends _i17.PageRouteInfo<void> {
  const ActivitiesFeedRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ActivitiesFeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivitiesFeedRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ActivitiesOverviewScreen]
class ActivitiesOverviewRoute extends _i17.PageRouteInfo<void> {
  const ActivitiesOverviewRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ActivitiesOverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivitiesOverviewRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ActivityDetailsScreen]
class ActivityDetailsRoute extends _i17.PageRouteInfo<void> {
  const ActivityDetailsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ActivityDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityDetailsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AuthenticationWrapperRouterPage]
class AuthWrapperRouter extends _i17.PageRouteInfo<void> {
  const AuthWrapperRouter({List<_i17.PageRouteInfo>? children})
      : super(
          AuthWrapperRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashboardScreen]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeStackScreen]
class HomeStackRoute extends _i17.PageRouteInfo<void> {
  const HomeStackRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeStackRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoadingWrapperRouterPage]
class LoadingWrapperRouter extends _i17.PageRouteInfo<void> {
  const LoadingWrapperRouter({List<_i17.PageRouteInfo>? children})
      : super(
          LoadingWrapperRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoadingWrapperRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MainWrapperRouterPage]
class MainWrapperRouter extends _i17.PageRouteInfo<void> {
  const MainWrapperRouter({List<_i17.PageRouteInfo>? children})
      : super(
          MainWrapperRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NotificationDetailsScreen]
class NotificationDetailsRoute extends _i17.PageRouteInfo<void> {
  const NotificationDetailsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          NotificationDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationDetailsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NotificationsScreen]
class NotificationsRoute extends _i17.PageRouteInfo<void> {
  const NotificationsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ResetPasswordScreen]
class ResetPasswordRoute extends _i17.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.RootWrapperRouterPage]
class RootWrapperRouter extends _i17.PageRouteInfo<void> {
  const RootWrapperRouter({List<_i17.PageRouteInfo>? children})
      : super(
          RootWrapperRouter.name,
          initialChildren: children,
        );

  static const String name = 'RootWrapperRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignUpScreen]
class SignUpRoute extends _i17.PageRouteInfo<void> {
  const SignUpRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
