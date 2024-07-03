library src.app.router.loading_wrapper;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'LoadingWrapperRouter')
class LoadingWrapperRouterPage extends StatelessWidget {
  const LoadingWrapperRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
