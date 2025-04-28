// import 'package:auto_route/auto_route.dart';
// import 'package:cluster_sales/src/core/navigation/app_router.gr.dart'
//     as AutoRouter;
// import 'package:ovida/src/core/navigation/route_names.dart';

// import '../utilities/app_logger.dart';

// @AutoRouterConfig()
// class AppRouter extends RootStackRouter {
//   final LoginRepo _loginRepo;

//   AppRouter({required LoginRepo loginRepo}) : _loginRepo = loginRepo;

//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(
//           page: AutoRouter.LoginRoute.page,
//           path: RouteNames.login,
//         ),
//         AutoRoute(
//           page: AutoRouter.HomeRoute.page,
//           path: RouteNames.home,
//           guards: [AuthGuard(loginRepo: _loginRepo)],
//         ),
//         AutoRoute(
//           page: AutoRouter.PharmacyRoute.page,
//           path: RouteNames.pharmacyProfile,
//         ),
//         AutoRoute(
//           page: AutoRouter.AddLeadRoute.page,
//           path: RouteNames.addLead,
//         ),
//         AutoRoute(
//           page: AutoRouter.AddLogRoute.page,
//           path: RouteNames.addLog,
//         ),
//         AutoRoute(
//           page: AutoRouter.MapRoute.page,
//           path: RouteNames.map,
//         ),
//         AutoRoute(
//           page: AutoRouter.SearchRoute.page,
//           path: RouteNames.search,
//         ),
//       ];
// }

// class AuthGuard extends AutoRouteGuard {
//   final LoginRepo _loginRepo;

//   AuthGuard({required LoginRepo loginRepo}) : _loginRepo = loginRepo;

//   @override
//   Future<void> onNavigation(
//       NavigationResolver resolver, StackRouter router) async {
//     if (_loginRepo.user == null) {
//       appLogger.i("User is not logged in, redirecting to login");
//       router.push(const AutoRouter.LoginRoute());
//       resolver.next(false);
//     } else {
//       resolver.next(true);
//     }
//   }
// }
