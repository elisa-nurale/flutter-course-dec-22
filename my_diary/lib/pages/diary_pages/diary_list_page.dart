import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/bloc/diary/diary_bloc.dart';
import 'package:flutter_course_dec_22/bloc/diary/diary_state.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';

class DiaryListPage extends StatefulWidget {
  const DiaryListPage({Key? key}) : super(key: key);

  @override
  State<DiaryListPage> createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Diary'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.router.push(DiaryDetailRoute());
        },
      ),
      body: BlocBuilder<DiaryBloc, DiaryState>(
        builder: (context, diaryState) {
          if(diaryState.status == DiaryStatus.loaded){
            final _diaryStatePages = diaryState.pages;

            return SafeArea(
                child: ListView.builder(
                  itemCount: _diaryStatePages.length, //diaryPages.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(
                          '${_diaryStatePages[index].dateTime.day}/${_diaryStatePages[index].dateTime.month}/${_diaryStatePages[index].dateTime.year}' /*diaryPages[index].dateTime.toString()*/),
                      subtitle: Text(_diaryStatePages[index].content),
                      onTap: () async {
                        final popped = await context.router.push(DiaryDetailRoute(page: _diaryStatePages[index]));
                        if (popped != null) {
                          print(true);
                        }
                      },
                    );
                  },
                ));
          }

          return const Center(child: CircularProgressIndicator(),);

        },
      ),
    );
  }
}
