library src.modules.activities.screens.feed;

import 'package:auto_route/auto_route.dart';
import 'package:financial_management/src/app/shared_controllers/tests_controller/tests_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ActivitiesFeedScreen extends StatelessWidget implements AutoRouteWrapper {
  const ActivitiesFeedScreen({super.key});

  @override
  Widget build(BuildContext context) => wrappedRoute(
        context,
      );

  @override
  Widget wrappedRoute(BuildContext context) =>
      const _ActivitiesFeedScreenView();
}

class _ActivitiesFeedScreenView extends StatefulWidget {
  const _ActivitiesFeedScreenView();

  @override
  State<_ActivitiesFeedScreenView> createState() =>
      _ActivitiesFeedScreenViewState();
}

class _ActivitiesFeedScreenViewState extends State<_ActivitiesFeedScreenView> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPersistentFrameCallback(
    //   (_) {
        _initialCalls();
    //   },
    // );
  }

  Future<void> _initialCalls() async {
    context.read<TestsController>().testCallUserMe();
    context.read<TestsController>().testCallUserYou();
    context.read<TestsController>().testCallUserMe();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
