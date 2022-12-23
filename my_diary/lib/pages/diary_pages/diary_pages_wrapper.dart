import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/bloc/auth/auth_event.dart';
import 'package:flutter_course_dec_22/bloc/diary/diary_bloc.dart';
import 'package:flutter_course_dec_22/bloc/diary/diary_event.dart';
import 'package:flutter_course_dec_22/bloc/diary_page/diary_page_bloc.dart';
import 'package:flutter_course_dec_22/injection/injection.dart';

import '../../bloc/auth/auth_bloc.dart';

class DiaryPagesWrapper extends StatelessWidget{
  const DiaryPagesWrapper({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<AuthBloc>()),
          BlocProvider(create: (_) => getIt<DiaryBloc>()..add(DiaryPagesLoaded())),
          BlocProvider(create: (_) => getIt<DiaryPageBloc>())
        ],
        child: const AutoRouter(),
    );
  }
}