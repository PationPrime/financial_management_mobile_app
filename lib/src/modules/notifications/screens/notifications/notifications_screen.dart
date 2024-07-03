library src.modules.notifications.screens.notifications;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget implements AutoRouteWrapper {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) => this;

  @override
  Widget wrappedRoute(BuildContext context) => const _NotificationsScreenView();
}

class _NotificationsScreenView extends StatelessWidget {
  const _NotificationsScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
