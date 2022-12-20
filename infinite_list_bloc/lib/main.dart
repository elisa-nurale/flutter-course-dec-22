import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:infinite_list_bloc/posts/view/post_page.dart';
import 'package:infinite_list_bloc/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostPage(),
    );
  }
}