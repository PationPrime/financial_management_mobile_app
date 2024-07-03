library src.app.router.home_stack;

import 'package:auto_route/auto_route.dart';
import 'package:financial_management/src/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeStackScreen extends StatelessWidget {
  const HomeStackScreen({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        routes: const [
          ActivitiesFeedRoute(),
          DashboardRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          backgroundColor: const Color.fromARGB(255, 29, 37, 51),
          onTap: tabsRouter.setActiveIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'Activities feed',
              activeIcon: Icon(Icons.feed),
              icon: Icon(Icons.feed),
            ),
            BottomNavigationBarItem(
              label: 'Dashboard',
              activeIcon: Icon(Icons.dashboard),
              icon: Icon(Icons.dashboard),
            ),
          ],
        ),
      );
}
