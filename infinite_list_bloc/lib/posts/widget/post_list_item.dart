import 'package:flutter/material.dart';
import 'package:infinite_list_bloc/posts/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  const PostListItem({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(post.id.toString()),
      title: Text(post.title),
      subtitle: Text(post.body),
      isThreeLine: true,
      dense: true
    );
  }
}
