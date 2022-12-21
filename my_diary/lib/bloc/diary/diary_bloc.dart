import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';
import 'package:isar/isar.dart';
import 'diary_state.dart';
import 'diary_event.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(const DiaryState.notLoaded()){
    on<DiaryPagesLoaded>(_onDiaryPagesLoaded);
  }

  Future<void> _onDiaryPagesLoaded(DiaryPagesLoaded event, Emitter<DiaryState> emit) async{
      emit(const DiaryState.loading());

      final Isar isar = Isar.getInstance() ?? await Isar.open([DiaryPageSchema]);
      final pages = await isar.diaryPages.where().findAll();
      emit(DiaryState.loaded(pages));
  }
}