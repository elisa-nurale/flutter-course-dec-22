import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../injection/injection.dart';

class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<AuthBloc>()..add(AuthInit()),
          child: const AutoRouter()
      );
  }
}
