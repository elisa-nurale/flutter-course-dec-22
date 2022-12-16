import 'package:auto_route/auto_route.dart';
import 'package:flutter_course_dec_22/pages/diary_pages/diary_detail_page.dart';
import 'package:flutter_course_dec_22/pages/diary_pages/diary_list_page.dart';
import 'package:flutter_course_dec_22/pages/login/login_page.dart';
import 'package:flutter_course_dec_22/router/router_guard.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: LoginPage, initial: true),
      AutoRoute(page: DiaryListPage, guards: [AuthGuard]),
      AutoRoute(page: DiaryDetailPage, guards: [AuthGuard]),
    ]
)
class $AppRouter{}
