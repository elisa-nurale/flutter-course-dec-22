import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';

class DiaryDetailPage extends StatefulWidget {
  final DiaryPage? page;
  const DiaryDetailPage({this.page, Key? key}) : super(key: key);

  @override
  State<DiaryDetailPage> createState() => _DiaryDetailPageState();
}

class _DiaryDetailPageState extends State<DiaryDetailPage> {
  late bool _isEditing;
  late String _title;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _isEditing = (widget.page == null);
    _title = widget.page == null
        ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
        : '${widget.page!.dateTime.day}/${widget.page!.dateTime.month}/${widget.page!.dateTime.year}';
    _contentController = TextEditingController(text: widget.page?.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isEditing ? Icons.save : Icons.edit),
        onPressed: (){
          setState(() {
            _isEditing = !_isEditing;
          });
          },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: TextField(
            controller: _contentController,
            readOnly: !_isEditing,
          ),
        ),
      ),
    );
  }
}
