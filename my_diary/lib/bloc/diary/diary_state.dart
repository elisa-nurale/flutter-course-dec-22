import 'package:equatable/equatable.dart';

import '../../models/diary_page.dart';

enum DiaryStatus {notLoaded, loading, loaded}

class DiaryState extends Equatable {
  final DiaryStatus status;
  final List<DiaryPage> pages;

  const DiaryState._({required this.status, this.pages = const []});

  @override
  List<Object?> get props => [status, pages];

  const DiaryState.notLoaded() : this._(status: DiaryStatus.notLoaded);

  const DiaryState.loading() : this._(status: DiaryStatus.loading);

  const DiaryState.loaded(List<DiaryPage> pages) : this._(status: DiaryStatus.loaded, pages: pages);
}