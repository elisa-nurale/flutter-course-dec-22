import 'package:bloc_arch/bloc/movies/movies_cubit.dart';
import 'package:bloc_arch/bloc/movies/movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, moviesState){
        /*if(moviesState is LoadingState){
          return const CircularProgressIndicator();
        }*/
        if(moviesState is ErrorState){
          return Text(moviesState.error);
        }
        if(moviesState is LoadedState){
          final movies = moviesState.movies;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  title: Text(movies[index].title),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(movies[index].urlImage),
                  )
                )
              );
            }
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
