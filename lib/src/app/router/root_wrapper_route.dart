library src.app.router.root_wrapper;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared_controllers/shared_controllers.dart';
import 'app_router.gr.dart';

@RoutePage(name: 'RootWrapperRouter')
class RootWrapperRouterPage extends StatefulWidget {
  const RootWrapperRouterPage({super.key});

  @override
  State<RootWrapperRouterPage> createState() => _RootWrapperRouterPageState();
}

class _RootWrapperRouterPageState extends State<RootWrapperRouterPage> {
  @override
  Widget build(BuildContext context) => BlocBuilder<AuthorizationController, AuthorizationState>(
        builder: (context, state) => AutoRouter.declarative(
          routes: (_) => [
            if (state is Authorized) const MainWrapperRouter(),
            if (state is Unauthorized) const AuthWrapperRouter(),
            if (state is InitialState) const LoadingWrapperRouter(),
          ],
        ),
      );
}
