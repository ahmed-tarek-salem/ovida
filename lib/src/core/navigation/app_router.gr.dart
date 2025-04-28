// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouterGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:auto_route/auto_route.dart' as _i8;
// import 'package:cluster_sales/src/features/add_lead/presentation/ui/screens/add_lead_screen.dart'
//     as _i1;
// import 'package:cluster_sales/src/features/add_lead/presentation/ui/screens/map_screen.dart'
//     as _i5;
// import 'package:cluster_sales/src/features/add_log/presentation/ui/screens/add_log_screen.dart'
//     as _i2;
// import 'package:cluster_sales/src/features/home/presentation/ui/home_screen.dart'
//     as _i3;
// import 'package:cluster_sales/src/features/login/presentation/ui/screens/login_screen.dart'
//     as _i4;
// import 'package:cluster_sales/src/features/pharmacy/presentation/ui/screen/pharmacy_screen.dart'
//     as _i6;
// import 'package:cluster_sales/src/features/search/presentation/ui/search_screen.dart'
//     as _i7;
// import 'package:flutter/material.dart' as _i9;

// /// generated route for
// /// [_i1.AddLeadScreen]
// class AddLeadRoute extends _i8.PageRouteInfo<void> {
//   const AddLeadRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           AddLeadRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'AddLeadRoute';

//   static _i8.PageInfo page = _i8.PageInfo(
//     name,
//     builder: (data) {
//       return _i8.WrappedRoute(child: const _i1.AddLeadScreen());
//     },
//   );
// }

// /// generated route for
// /// [_i2.AddLogScreen]
// class AddLogRoute extends _i8.PageRouteInfo<AddLogRouteArgs> {
//   AddLogRoute({
//     _i9.Key? key,
//     required int pharmacyId,
//     List<_i8.PageRouteInfo>? children,
//   }) : super(
//           AddLogRoute.name,
//           args: AddLogRouteArgs(
//             key: key,
//             pharmacyId: pharmacyId,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'AddLogRoute';

//   static _i8.PageInfo page = _i8.PageInfo(
//     name,
//     builder: (data) {
//       final args = data.argsAs<AddLogRouteArgs>();
//       return _i8.WrappedRoute(
//           child: _i2.AddLogScreen(
//         key: args.key,
//         pharmacyId: args.pharmacyId,
//       ));
//     },
//   );
// }

// class AddLogRouteArgs {
//   const AddLogRouteArgs({
//     this.key,
//     required this.pharmacyId,
//   });

//   final _i9.Key? key;

//   final int pharmacyId;

//   @override
//   String toString() {
//     return 'AddLogRouteArgs{key: $key, pharmacyId: $pharmacyId}';
//   }
// }

// /// generated route for
// /// [_i3.HomeScreen]
// class HomeRoute extends _i8.PageRouteInfo<void> {
//   const HomeRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           HomeRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'HomeRoute';

//   static _i8.PageInfo page = _i8.PageInfo(
//     name,
//     builder: (data) {
//       return _i8.WrappedRoute(child: const _i3.HomeScreen());
//     },
//   );
// }

// /// generated route for
// /// [_i4.LoginScreen]
// class LoginRoute extends _i8.PageRouteInfo<void> {
//   const LoginRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           LoginRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'LoginRoute';

//   static _i8.PageInfo page = _i8.PageInfo(
//     name,
//     builder: (data) {
//       return const _i4.LoginScreen();
//     },
//   );
// }

// /// generated route for
// /// [_i5.MapScreen]
// class MapRoute extends _i8.PageRouteInfo<void> {
//   const MapRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           MapRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'MapRoute';

//   static _i8.PageInfo page = _i8.PageInfo(
//     name,
//     builder: (data) {
//       return const _i5.MapScreen();
//     },
//   );
// }

// /// generated route for
// /// [_i6.PharmacyScreen]
// class PharmacyRoute extends _i8.PageRouteInfo<void> {
//   const PharmacyRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           PharmacyRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'PharmacyRoute';

//   static _i8.PageInfo page = _i8.PageInfo(
//     name,
//     builder: (data) {
//       return _i8.WrappedRoute(child: const _i6.PharmacyScreen());
//     },
//   );
// }

// /// generated route for
// /// [_i7.SearchScreen]
// class SearchRoute extends _i8.PageRouteInfo<void> {
//   const SearchRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           SearchRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'SearchRoute';

//   static _i8.PageInfo page = _i8.PageInfo(
//     name,
//     builder: (data) {
//       return _i7.SearchScreen();
//     },
//   );
// }
