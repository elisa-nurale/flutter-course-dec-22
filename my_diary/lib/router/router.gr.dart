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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../models/diary_page.dart' as _i8;
import '../pages/diary_pages/diary_detail_page.dart' as _i5;
import '../pages/diary_pages/diary_list_page.dart' as _i4;
import '../pages/diary_pages/diary_pages_wrapper.dart' as _i2;
import '../pages/login/login_page.dart' as _i3;
import '../pages/login/login_page_wrapper.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginPageWrapper.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPageWrapper(),
      );
    },
    DiaryPagesWrapper.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DiaryPagesWrapper(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    DiaryListRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DiaryListPage(),
      );
    },
    DiaryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DiaryDetailRouteArgs>(
          orElse: () => const DiaryDetailRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.DiaryDetailPage(
          page: args.page,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'login-page-wrapper',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          LoginPageWrapper.name,
          path: 'login-page-wrapper',
          children: [
            _i6.RouteConfig(
              LoginRoute.name,
              path: '',
              parent: LoginPageWrapper.name,
            )
          ],
        ),
        _i6.RouteConfig(
          DiaryPagesWrapper.name,
          path: 'diary-pages-wrapper',
          children: [
            _i6.RouteConfig(
              DiaryListRoute.name,
              path: '',
              parent: DiaryPagesWrapper.name,
            ),
            _i6.RouteConfig(
              DiaryDetailRoute.name,
              path: 'detail',
              parent: DiaryPagesWrapper.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPageWrapper]
class LoginPageWrapper extends _i6.PageRouteInfo<void> {
  const LoginPageWrapper({List<_i6.PageRouteInfo>? children})
      : super(
          LoginPageWrapper.name,
          path: 'login-page-wrapper',
          initialChildren: children,
        );

  static const String name = 'LoginPageWrapper';
}

/// generated route for
/// [_i2.DiaryPagesWrapper]
class DiaryPagesWrapper extends _i6.PageRouteInfo<void> {
  const DiaryPagesWrapper({List<_i6.PageRouteInfo>? children})
      : super(
          DiaryPagesWrapper.name,
          path: 'diary-pages-wrapper',
          initialChildren: children,
        );

  static const String name = 'DiaryPagesWrapper';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.DiaryListPage]
class DiaryListRoute extends _i6.PageRouteInfo<void> {
  const DiaryListRoute()
      : super(
          DiaryListRoute.name,
          path: '',
        );

  static const String name = 'DiaryListRoute';
}

/// generated route for
/// [_i5.DiaryDetailPage]
class DiaryDetailRoute extends _i6.PageRouteInfo<DiaryDetailRouteArgs> {
  DiaryDetailRoute({
    _i8.DiaryPage? page,
    _i7.Key? key,
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

  final _i7.Key? key;

  @override
  String toString() {
    return 'DiaryDetailRouteArgs{page: $page, key: $key}';
  }
}
