import 'package:equatable/equatable.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';

abstract class DiaryPageEvent extends Equatable{
  const DiaryPageEvent();

  @override
  List<Object?> get props => [];
}

class DiaryPageLoaded extends DiaryPageEvent{
  final DiaryPage? page;
  const DiaryPageLoaded({this.page});

  @override
  List<Object?> get props => [page];
}

class DiaryPageViewed extends DiaryPageEvent{
  final DiaryPage page;
  const DiaryPageViewed({required this.page});

  @override
  List<Object?> get props => [page];
}

class DiaryPageEdited extends DiaryPageEvent{
  final DiaryPage? page;
  const DiaryPageEdited({this.page});

  @override
  List<Object?> get props => [page];
}

class DiaryPageSaved extends DiaryPageEvent{
  final DiaryPage page;
  const DiaryPageSaved({required this.page});

  @override
  List<Object?> get props => [page];
}