library src.modules.activities.screens.activity_details;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActivityDetailsScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const ActivityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => this;

  @override
  Widget wrappedRoute(BuildContext context) =>
      const _ActivityDetailsScreenView();
}

class _ActivityDetailsScreenView extends StatelessWidget {
  const _ActivityDetailsScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
