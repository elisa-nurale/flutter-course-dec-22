import 'package:bloc_arch/bloc/movies/movies_state.dart';
import 'package:bloc_arch/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesCubit extends Cubit<MoviesState>{
  final MovieRepository moviesRepository;

  MoviesCubit({required this.moviesRepository}) : super(InitialState()){
    getTrendingMovies();
  }

  getTrendingMovies() async{
    emit(LoadingState());
    try{
      final movies = await moviesRepository.getMovies();
      emit(LoadedState(movies));
    } catch(e){
      emit(ErrorState(e.toString()));
    }
  }

}