import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/consts/app_routing.dart';
import 'package:loanxtimate/settings/account_settings.dart';
import 'package:loanxtimate/ui/page.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();
final subShellNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  initialLocation: '/account/my-profile',
  errorBuilder: (context, state) => Center(
    child: Text("Error Code 404: Page Not found"),
  ),
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => MyHomePage(child),
      routes: [
        GoRoute(
          path: AppRouting.account,
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => const AccountSettingsScreen(),
          routes: [
            GoRoute(
              path: 'my-profile',
              builder: (context, state) => const Center(),
            ),
            GoRoute(
                path: 'credentials',
                builder: (context, state) => const Center()),
            GoRoute(
                path: 'account-plans',
                builder: (context, state) => const Center()),
            GoRoute(
                path: 'billing', builder: (context, state) => const Center()),
            GoRoute(
                path: 'integrations',
                builder: (context, state) => const Center()),
          ],
        ),
        GoRoute(
          path: AppRouting.home,
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => Container(
            color: AppColors.white,
            child: const Center(
              child: Text(
                'home',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ),
        GoRoute(
          path: AppRouting.generateLE,
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => Container(
            color: AppColors.white,
            child: const Center(
              child: Text(
                'Generate LE',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ),
        GoRoute(
          path: AppRouting.customizeFees,
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => Container(
            color: AppColors.white,
            child: const Center(
              child: Text(
                'Customize Fees',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ),
        GoRoute(
          path: AppRouting.support,
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => Container(
            color: AppColors.white,
            child: const Center(
              child: Text(
                'Support',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ),
      ],
    ),
  ],
);
