import 'package:bloc_arch/model/movie_model.dart';
import 'package:equatable/equatable.dart';

abstract class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends MoviesState{}

class LoadingState extends MoviesState{}

class LoadedState extends MoviesState{
  final List<MovieModel> movies;
  LoadedState(this.movies);

  @override
  List<Object?> get props => [movies];
}

class ErrorState extends MoviesState{
  final String error;
  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}