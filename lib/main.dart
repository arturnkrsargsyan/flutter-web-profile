import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/providers/page_provider.dart';
import 'package:loanxtimate/providers/user_provider.dart';
import 'package:loanxtimate/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:loanxtimate/ui/page.dart';
import 'package:responsive_framework/responsive_framework.dart';

final userProvider = ChangeNotifierProvider((ref) => UserProvder());
final pageProvider = ChangeNotifierProvider((ref) => PageProvider());
const double webMinWidth = 823;

void main() {
  usePathUrlStrategy();
  runApp(const ProviderScope(child: App()));
}

// final GoRouter goRouter = GoRouter(routes: []);

class App extends StatefulWidget {
  const App({super.key});

  static const title = 'LoanXtimate';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.light,
      dark: AppTheme.dark,
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 960, name: TABLET),
            const Breakpoint(start: 961, end: 1200, name: 'SMALLDESKTOP'),
            const Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
          ],
          child: const MyApp()

          // MaterialApp.router(
          //   title: App.title,
          //   routerConfig: router,
          //   theme: theme,
          //   darkTheme: darkTheme,
          //   scrollBehavior: MaterialScrollBehavior().copyWith(
          //     dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
          //   ),
          // ),
          ),
    );
  }
}
