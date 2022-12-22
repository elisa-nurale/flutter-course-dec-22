import 'package:auto_route/auto_route.dart';
import 'package:flutter_course_dec_22/pages/diary_pages/diary_detail_page.dart';
import 'package:flutter_course_dec_22/pages/diary_pages/diary_list_page.dart';
import 'package:flutter_course_dec_22/pages/login/login_page.dart';
import 'package:flutter_course_dec_22/router/router_guard.dart';

import '../pages/diary_pages/diary_pages_wrapper.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: LoginPage, initial: true),
      AutoRoute(
        page: DiaryPagesWrapper,
        name: 'DiaryPagesWrapper',
        path: 'diary-pages-wrapper',
        children: [
          AutoRoute(page: DiaryListPage, path: '', guards: [AuthGuard]),
          AutoRoute(page: DiaryDetailPage, path: 'detail', guards: [AuthGuard])
        ]
      )
    ]
)
class $AppRouter{}