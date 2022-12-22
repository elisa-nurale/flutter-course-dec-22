import 'package:flutter/material.dart';
import 'package:infinite_list_bloc/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc/posts/widget/bottom_loader.dart';
import 'package:infinite_list_bloc/posts/widget/post_list_item.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override void dispose() {
    _scrollController
    ..removeListener(_onScroll)
    ..dispose();
    super.dispose();
  }

  void _onScroll(){
    if(_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
        builder: (context, postState){
          switch(postState.status){
            case PostStatus.failure:
              return const Center(child: Text('failed to fetch posts'),);
            case PostStatus.success:
               if(postState.posts.isEmpty) {
                 return const Text('no posts');
               }
               return ListView.builder(
                 controller: _scrollController,
                 itemCount: postState.hasReachedMax
                   ? postState.posts.length
                   : postState.posts.length + 1,
                 itemBuilder: (context, index){
                   return index >= postState.posts.length
                       ? const BottomLoader()
                       : PostListItem(post: postState.posts[index]);
                 }
               );
           case PostStatus.initial:
              return const CircularProgressIndicator();
          }
        }
    );
  }
}
