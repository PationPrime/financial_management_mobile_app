library src.modules.activities.screens.overview;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActivitiesOverviewScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const ActivitiesOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) => this;

  @override
  Widget wrappedRoute(BuildContext context) =>
      const _ActivitiesOverviewScreenView();
}

class _ActivitiesOverviewScreenView extends StatelessWidget {
  const _ActivitiesOverviewScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
