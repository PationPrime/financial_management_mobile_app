library src.app.router.main_wrapper;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'MainWrapperRouter')
class MainWrapperRouterPage extends StatelessWidget {
  const MainWrapperRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();
}
