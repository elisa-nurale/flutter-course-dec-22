// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/diary_pages/diary_detail_page.dart' as _i3;
import '../pages/diary_pages/diary_list_page.dart' as _i2;
import '../pages/login/login_page.dart' as _i1;
import 'router_guard.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter({
    _i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    DiaryListRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DiaryListPage(),
      );
    },
    DiaryDetailRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DiaryDetailPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          DiaryListRoute.name,
          path: '/diary-list-page',
          guards: [authGuard],
        ),
        _i4.RouteConfig(
          DiaryDetailRoute.name,
          path: '/diary-detail-page',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.DiaryListPage]
class DiaryListRoute extends _i4.PageRouteInfo<void> {
  const DiaryListRoute()
      : super(
          DiaryListRoute.name,
          path: '/diary-list-page',
        );

  static const String name = 'DiaryListRoute';
}

/// generated route for
/// [_i3.DiaryDetailPage]
class DiaryDetailRoute extends _i4.PageRouteInfo<void> {
  const DiaryDetailRoute()
      : super(
          DiaryDetailRoute.name,
          path: '/diary-detail-page',
        );

  static const String name = 'DiaryDetailRoute';
}
