import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';
import 'package:isar/isar.dart';

class DiaryListPage extends StatefulWidget {
  DiaryListPage({Key? key}) : super(key: key);

  @override
  State<DiaryListPage> createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {
  late final Isar _isar;
  late List<DiaryPage> _pages;

  final diaryPages = [
    DiaryPage(dateTime: DateTime(2022, 12, 15), content: 'Oggi ho iniziato il corso di Flutter'),
    DiaryPage(dateTime: DateTime(2022, 12, 16), content: 'Oggi è il secondo giorno del corso di Flutter'),
  ];

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  void _initDb(){
    _isar = Isar.getInstance() ?? Isar.openSync([DiaryPageSchema]);
    _pages = _isar.diaryPages.where().findAllSync();
    if(_pages.isEmpty){
      //voglio aggiungere le mie pagine hardcodate nel db
      _isar.writeTxnSync(() => _isar.diaryPages.putAllSync(diaryPages));
    } else {
      _isar.writeTxnSync(() => _isar.diaryPages.where().deleteAllSync());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Diary'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          context.router.push(DiaryDetailRoute());
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _pages.length,//diaryPages.length,
          itemBuilder: (_, index){
            return ListTile(
              title: Text('${_pages[index].dateTime.day}/${_pages[index].dateTime.month}/${_pages[index].dateTime.year}'/*diaryPages[index].dateTime.toString()*/),
              subtitle: Text(_pages[index].content),
              onTap: (){
                context.router.push(DiaryDetailRoute(page: _pages[index]));
              },
            );
          },
        )
      ),
    );
  }
}
