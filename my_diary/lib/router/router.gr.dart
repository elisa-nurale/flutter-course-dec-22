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

import '../models/diary_page.dart' as _i7;
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
      final args = routeData.argsAs<DiaryListRouteArgs>(
          orElse: () => const DiaryListRouteArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DiaryListPage(key: args.key),
      );
    },
    DiaryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryDetailRouteArgs>(
          orElse: () => const DiaryDetailRouteArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DiaryDetailPage(
          page: args.page,
          key: args.key,
        ),
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
class DiaryListRoute extends _i4.PageRouteInfo<DiaryListRouteArgs> {
  DiaryListRoute({_i5.Key? key})
      : super(
          DiaryListRoute.name,
          path: '/diary-list-page',
          args: DiaryListRouteArgs(key: key),
        );

  static const String name = 'DiaryListRoute';
}

class DiaryListRouteArgs {
  const DiaryListRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'DiaryListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.DiaryDetailPage]
class DiaryDetailRoute extends _i4.PageRouteInfo<DiaryDetailRouteArgs> {
  DiaryDetailRoute({
    _i7.DiaryPage? page,
    _i5.Key? key,
  }) : super(
          DiaryDetailRoute.name,
          path: '/diary-detail-page',
          args: DiaryDetailRouteArgs(
            page: page,
            key: key,
          ),
        );

  static const String name = 'DiaryDetailRoute';
}

class DiaryDetailRouteArgs {
  const DiaryDetailRouteArgs({
    this.page,
    this.key,
  });

  final _i7.DiaryPage? page;

  final _i5.Key? key;

  @override
  String toString() {
    return 'DiaryDetailRouteArgs{page: $page, key: $key}';
  }
}
