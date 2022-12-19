import 'package:bloc_arch/repository/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/movies/movies_cubit.dart';
import 'page/movies_page.dart';
import 'package:dio/dio.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => MoviesCubit(moviesRepository: MovieRepository(Dio())),
        child: MoviesPage(),
      ),
    );
  }
}

