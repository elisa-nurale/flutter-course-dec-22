// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/auth/auth_bloc.dart' as _i3;
import '../bloc/diary/diary_bloc.dart' as _i4;
import '../bloc/diary_page/diary_page_bloc.dart' as _i5;
import '../bloc/notification/notification_bloc.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthBloc>(() => _i3.AuthBloc());
  gh.factory<_i4.DiaryBloc>(() => _i4.DiaryBloc());
  gh.factory<_i5.DiaryPageBloc>(() => _i5.DiaryPageBloc());
  gh.factory<_i6.NotificationBloc>(() => _i6.NotificationBloc());
  return get;
}
