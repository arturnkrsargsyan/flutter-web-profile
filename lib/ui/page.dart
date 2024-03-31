import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/routing/back_button_dispatcher.dart';
import 'package:loanxtimate/routing/route_config.dart';
import 'package:loanxtimate/routing/url_handler/information_parser.dart';
import 'package:loanxtimate/routing/url_handler/router_delegate.dart';
import 'package:loanxtimate/settings/account_settings.dart';
import 'package:loanxtimate/ui/navigation/custom_side_menu.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../logger.dart';
import 'navigation/drawer.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();
final subShellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/account/my-profile',
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => MyHomePage(child),
      routes: [
        GoRoute(
          path: '/account',
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
          path: '/',
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
          path: '/generate-le',
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
          path: '/customize-fees',
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
          path: '/support',
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerDelegate: UrlHandlerRouterDelegate(),
      // routeInformationParser: UrlHandlerInformationParser(),
      // backButtonDispatcher: UroHandlerButtonDispatcher(),
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      // home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  final Widget child;
  const MyHomePage(
    this.child, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = usePageController(initialPage: 5);
    SideMenuController sideMenu = SideMenuController(initialPage: 5);

    useEffect(
      () {
        sideMenu.addListener((index) {
          pageController.jumpToPage(index);
        });
        return () {
          sideMenu.dispose();
        };
      },
    );

    logger.info(
        'breakpoint: ${ResponsiveBreakpoints.of(context).breakpoint.name}');
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    double screenHeight = MediaQuery.of(context).size.height;

    double topPadding = screenHeight / 10;
    return Scaffold(
      appBar: breakpoint.name == MOBILE || breakpoint.name == TABLET
          ? AppBar(
              title: const Text(
                'Current Page name',
                style: TextStyle(
                  color: AppColors.greyTextInput,
                ),
              ),
              backgroundColor: AppColors.white2,
              iconTheme: const IconThemeData(
                color: Colors.grey,
              ),
            )
          : null,
      drawer: breakpoint.name == MOBILE || breakpoint.name == TABLET
          ? DrawerWidget(
              sideMenu: sideMenu,
              pageController: pageController,
            )
          : null,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (breakpoint.name == DESKTOP || breakpoint.name == 'SMALLDESKTOP')
            CustomSideMenu(
                sideMenu: sideMenu,
                breakpoint: breakpoint,
                topPadding: topPadding),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  color: AppColors.white,
                  child: const Center(
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.white,
                  child: const Center(
                    child: Text(
                      'Generate LE',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.white,
                  child: const Center(
                    child: Text(
                      'Customize Fees',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.white,
                  child: const Center(
                    child: Text(
                      'Support',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                const AccountSettingsScreen(),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
