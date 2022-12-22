import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_dec_22/bloc/diary/diary_bloc.dart';
import 'package:flutter_course_dec_22/bloc/diary/diary_event.dart';
import 'package:flutter_course_dec_22/bloc/diary_page/diary_page_bloc.dart';
import 'package:flutter_course_dec_22/bloc/diary_page/diary_page_event.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';
import 'package:isar/isar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/diary_page/diary_page_state.dart';

class DiaryDetailPage extends StatefulWidget {
  final DiaryPage? page;
  const DiaryDetailPage({this.page, Key? key}) : super(key: key);

  @override
  State<DiaryDetailPage> createState() => _DiaryDetailPageState();
}

class _DiaryDetailPageState extends State<DiaryDetailPage> {
  //late bool _isEditing;
  late String _title;
  late TextEditingController _contentController;
  //late Isar _isar;

  @override
  void initState() {
    super.initState();
    //_isar = Isar.getInstance() ?? Isar.openSync([DiaryPageSchema]);
    //_isEditing = (widget.page == null);
    context.read<DiaryPageBloc>().add(DiaryPageLoaded(page: widget.page));
    _title = widget.page == null
        ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
        : '${widget.page!.dateTime.day}/${widget.page!.dateTime.month}/${widget.page!.dateTime.year}';
    _contentController = TextEditingController(text: widget.page?.content);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiaryPageBloc, DiaryPageState>(
      listenWhen: (previousState, currentState){
        return previousState.page?.content != currentState.page?.content;
      },
    listener: (context, diaryPageState) {
      context.read<DiaryBloc>().add(DiaryPagesLoaded());
    },
  builder: (context, diaryPageState) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      floatingActionButton: FloatingActionButton(
        child: Icon(diaryPageState.status == DiaryPageStatus.editing ? Icons.save : Icons.edit),
        onPressed: (){
         if (diaryPageState.status == DiaryPageStatus.editing) {
           context.read<DiaryPageBloc>().add(DiaryPageSaved(
               page: widget.page == null
                   ? DiaryPage(dateTime: DateTime.now(), content: _contentController.text)
                   : widget.page!.copyWith(content: _contentController.text)));
         } else {
           context.read<DiaryPageBloc>().add(DiaryPageEdited(page: widget.page));
         }
       /*   if(widget.page == null){
            _isar.writeTxnSync(() =>
                _isar.diaryPages.putSync(DiaryPage(dateTime: DateTime.now(), content: _contentController.text))
            );
          }
          else {
            _isar.writeTxnSync(() =>
                _isar.diaryPages.putSync(DiaryPage(dateTime: widget.page!.dateTime, content: _contentController.text)..id=widget.page!.id)
            );
          }
          setState(() {
            _isEditing = !_isEditing;
          });*/
          },
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListView(
          children:[diaryPageState.status == DiaryPageStatus.editing
              ? TextField(
            controller: _contentController,
          )
              : Text(_contentController.text, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: diaryPageState.page?.images?.asMap().values.map((image) => Image.network(image, height: 150,)).toList() ?? [],
          ),
          if(widget.page != null && diaryPageState.status == DiaryPageStatus.reading) ElevatedButton(
              child: const Text('Aggiungi immagine'),
              onPressed: () {
                context.read<DiaryPageBloc>().add(DiaryPageImageAdded(page: widget.page!.copyWith(content: _contentController.text)));
                },

          ),
          ]
        ),
      ),
    );
  },
);
  }
}
