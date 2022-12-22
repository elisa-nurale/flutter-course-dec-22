import 'package:equatable/equatable.dart';

abstract class DiaryEvent extends Equatable{
  const DiaryEvent();

  @override
  List<Object?> get props => [];
}

class DiaryPagesLoaded extends DiaryEvent{}