import 'package:equatable/equatable.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';

enum DiaryPageStatus {initial, reading, editing, error}

class DiaryPageState extends Equatable{
  final DiaryPageStatus status;
  final DiaryPage? page;

  const DiaryPageState._({required this.status, this.page});

  const DiaryPageState.initial() : this._(status: DiaryPageStatus.initial);
  const DiaryPageState.reading({required DiaryPage page}) : this._(status: DiaryPageStatus.reading, page: page);
  const DiaryPageState.editing({DiaryPage? page}) : this._(status: DiaryPageStatus.editing, page: page);
  const DiaryPageState.error() : this._(status: DiaryPageStatus.error);

  @override
  List<Object?> get props => [status, page];
}
