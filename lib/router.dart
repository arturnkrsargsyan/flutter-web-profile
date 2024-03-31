// import 'package:collection/collection.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:loanxtimate/features/users/user_not_found_page.dart';
// import 'package:loanxtimate/settings/account_settings.dart';

// import 'features/dashboard/dashbord_page.dart';
// import 'features/users/dummy_users.dart';
// import 'features/users/user_page.dart';
// import 'features/users/users_page.dart';
// import 'widgets/widgets.dart';

// part 'router.g.dart';

// const routerInitialLocation = '/';

// final router = GoRouter(
//   routes: $appRoutes,
//   debugLogDiagnostics: kDebugMode,
//   initialLocation: routerInitialLocation,
// );

// @TypedStatefulShellRoute<ShellRouteData>(
//   branches: [
//     TypedStatefulShellBranch(
//       routes: [
//         TypedGoRoute<DashboardRoute>(
//           path: routerInitialLocation,
//         ),
//         TypedGoRoute<AccountSettingsPageRoute>(
//           path: '/settings', // This will match '/settings' as a top-level route
//         ),
//       ],
//     ),

//     TypedStatefulShellBranch(
//       routes: [
//         TypedGoRoute<UsersPageRoute>(
//           path: '/users',
//           routes: [
//             TypedGoRoute<UserPageRoute>(
//               path: ':userId',
//             ),
//           ],
//         ),
//       ],
//     ),
//     // Add a new branch for the AccountSettingsPage if it needs a specific shell, or add it as a standalone route below
//   ],


// )
// class ShellRouteData extends StatefulShellRouteData {
//   const ShellRouteData();

//   @override
//   Widget builder(
//       BuildContext context,
//       GoRouterState state,
//       StatefulNavigationShell navigationShell,
//       ) {
//     return SelectionArea(
//       child: ScaffoldWithNavigation(
//         navigationShell: navigationShell,
//       ),
//     );
//   }
// }

// class DashboardRoute extends GoRouteData {
//   const DashboardRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const DashBoardPage();
//   }
// }

// class UsersPageRoute extends GoRouteData {
//   const UsersPageRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const UsersPage();
//   }
// }

// class UserPageRoute extends GoRouteData {
//   const UserPageRoute({required this.userId});

//   final String userId;

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     final user = dummyUsers.firstWhereOrNull((e) => e.userId == userId);
//     return user == null
//         ? UserNotFoundPage(userId: userId)
//         : UserPage(user: user);
//   }
// }

// // Define the AccountSettingsPageRoute as a top-level route
// class AccountSettingsPageRoute extends GoRouteData {
//   const AccountSettingsPageRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return AccountSettingsPage(); // Ensure this widget is defined in your project
//   }
// }
