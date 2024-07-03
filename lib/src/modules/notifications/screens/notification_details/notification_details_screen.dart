library src.modules.notifications.screens.notification_details;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationDetailsScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => this;

  @override
  Widget wrappedRoute(BuildContext context) =>
      const _NotificationDetailsScreenView();
}

class _NotificationDetailsScreenView extends StatelessWidget {
  const _NotificationDetailsScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
