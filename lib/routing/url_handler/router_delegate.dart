import 'package:flutter/material.dart';
import 'package:loanxtimate/routing/navigation_state.dart';
import 'package:loanxtimate/settings/account_settings.dart';
import 'package:loanxtimate/ui/page.dart';

final GlobalKey<NavigatorState> _urlHandlerRouterDelegateNavigatorKey =
    GlobalKey<NavigatorState>();

class UrlHandlerRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  Widget widget = const AccountSettingsScreen();
  String newPath = "/";

  @override
  Widget build(BuildContext context) {
    print(widget);
    return Navigator(
      pages: const [
        MaterialPage(
          child: MyHomePage(
            AccountSettingsScreen(),
          ),
        ),
      ],
      onPopPage: (_, __) {
        // We don't handle routing logic here, so we just return false
        return false;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey =>
      _urlHandlerRouterDelegateNavigatorKey;

  // Navigation state to app state
  @override
  Future<void> setNewRoutePath(NavigationState navigationState) async {
    // If a value which is not a number has been entered,
    // navigationState.value is null so we just notifyListeners
    // without changing the app state to change the value of the url
    // to its previous value
    if (navigationState.path == null) {
      notifyListeners();
      return;
    }
    newPath = navigationState.path;
    // Get the new count, which is navigationState.value//10
    //  widget = navigationState.path
    // count = (navigationState.value / 10).floor();

    // If the navigationState.value was not a multiple of 10
    // the url is not equal to count*10, therefore the url isn't right
    // In that case, we notifyListener in order to get the valid NavigationState
    // from the new app state
    // if (count * 10 != navigationState.value) notifyListeners();

    return null;
  }
  // void urlHandler(String path){
  //   if (path = "/account") {
  //   }
  // }

  // App state to Navigation state, triggered by notifyListeners()
  @override
  NavigationState get currentConfiguration => NavigationState(newPath);
  // void increase() {
  //   count++;
  //   notifyListeners();
  // }
}
