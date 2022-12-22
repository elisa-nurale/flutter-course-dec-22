import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_list_bloc/posts/models/post.dart';
import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  PostBloc({required this.httpClient}) : super(const PostState()){
    on<PostFetched>(_onPostFetched);
  }

  Future<void> _onPostFetched(PostFetched event, Emitter<PostState> emit) async{
    if(state.hasReachedMax) return;

    try{
      if(state.status == PostStatus.initial){
        final posts = await _fetchPosts();
        return emit(state.copyWith(
            status: PostStatus.success,
            posts: posts,
            hasReachedMax: false
        ));
      }
      final posts = await _fetchPosts(state.posts.length);
      emit (posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false
            ),
      );
    }
    catch(e){
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async{
    final response = await httpClient.get(
      Uri.https('jsonplaceholder.typicode.com',
          '/posts',
          <String, String>{'_start': '$startIndex', '_limit': '15'},
      )
    );
    if(response.statusCode == 200){
      final body = jsonDecode(response.body) as List;
      return body.map((dynamic json){
        final map = json as Map<String, dynamic>;
        return Post(
          id: map['id'] as int,
          title: map['title'] as String,
          body: map['body'] as String
        );
      }).toList();
    }
    throw Exception('error retreiving posts');
  }
}