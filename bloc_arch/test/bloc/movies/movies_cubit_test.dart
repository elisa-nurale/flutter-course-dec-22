import 'package:bloc_arch/bloc/movies/movies_cubit.dart';
import 'package:bloc_arch/bloc/movies/movies_state.dart';
import 'package:bloc_arch/model/movie_model.dart';
import 'package:bloc_arch/repository/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements MovieRepository {}

void main(){
  late MockRepository movieRepository;
  late MoviesCubit moviesCubit;

  const movies = [
    MovieModel(title: 'title 1', urlImage: 'url_1'),
    MovieModel(title: 'title 2', urlImage: 'url_2'),
  ];

  setUp(() {
    movieRepository = MockRepository();
    when(() => movieRepository.getMovies())
        .thenAnswer((_) async => movies);
  });

  test('Emits movies when repository answer correctly', () async {
    moviesCubit = MoviesCubit(moviesRepository: movieRepository);
    await expectLater(
      moviesCubit.stream,
      emits(LoadedState(movies))
    );
  });
}