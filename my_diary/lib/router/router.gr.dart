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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../models/diary_page.dart' as _i8;
import '../pages/diary_pages/diary_detail_page.dart' as _i4;
import '../pages/diary_pages/diary_list_page.dart' as _i3;
import '../pages/diary_pages/diary_pages_wrapper.dart' as _i2;
import '../pages/login/login_page.dart' as _i1;
import 'router_guard.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter({
    _i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    DiaryPagesWrapper.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DiaryPagesWrapper(),
      );
    },
    DiaryListRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryListRouteArgs>(
          orElse: () => const DiaryListRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DiaryListPage(key: args.key),
      );
    },
    DiaryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryDetailRouteArgs>(
          orElse: () => const DiaryDetailRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DiaryDetailPage(
          page: args.page,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          DiaryPagesWrapper.name,
          path: 'diary-pages-wrapper',
          children: [
            _i5.RouteConfig(
              DiaryListRoute.name,
              path: '',
              parent: DiaryPagesWrapper.name,
              guards: [authGuard],
            ),
            _i5.RouteConfig(
              DiaryDetailRoute.name,
              path: 'detail',
              parent: DiaryPagesWrapper.name,
              guards: [authGuard],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.DiaryPagesWrapper]
class DiaryPagesWrapper extends _i5.PageRouteInfo<void> {
  const DiaryPagesWrapper({List<_i5.PageRouteInfo>? children})
      : super(
          DiaryPagesWrapper.name,
          path: 'diary-pages-wrapper',
          initialChildren: children,
        );

  static const String name = 'DiaryPagesWrapper';
}

/// generated route for
/// [_i3.DiaryListPage]
class DiaryListRoute extends _i5.PageRouteInfo<DiaryListRouteArgs> {
  DiaryListRoute({_i6.Key? key})
      : super(
          DiaryListRoute.name,
          path: '',
          args: DiaryListRouteArgs(key: key),
        );

  static const String name = 'DiaryListRoute';
}

class DiaryListRouteArgs {
  const DiaryListRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'DiaryListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.DiaryDetailPage]
class DiaryDetailRoute extends _i5.PageRouteInfo<DiaryDetailRouteArgs> {
  DiaryDetailRoute({
    _i8.DiaryPage? page,
    _i6.Key? key,
  }) : super(
          DiaryDetailRoute.name,
          path: 'detail',
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

  final _i8.DiaryPage? page;

  final _i6.Key? key;

  @override
  String toString() {
    return 'DiaryDetailRouteArgs{page: $page, key: $key}';
  }
}
