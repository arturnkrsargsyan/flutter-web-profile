import 'package:flutter/material.dart';
import 'package:loanxtimate/routing/navigation_state.dart';

class UrlHandlerInformationParser
    extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    print(routeInformation.uri.path);
    return NavigationState(routeInformation.location.substring(1));
  }

  @override
  RouteInformation restoreRouteInformation(NavigationState navigationState) {
    return RouteInformation(location: '/${navigationState.path}');
  }
}
