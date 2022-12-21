import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';
import 'package:isar/isar.dart';
import 'package:injectable/injectable.dart';

import 'diary_page_event.dart';
import 'diary_page_state.dart';

@injectable
class DiaryPageBloc extends Bloc<DiaryPageEvent, DiaryPageState>{
  DiaryPageBloc() : super(const DiaryPageState.initial()) {
    on<DiaryPageLoaded>(_onDiaryPageLoaded);
    on<DiaryPageViewed>(_onDiaryPageViewed); // da editing -> visualizzazione
    on<DiaryPageEdited>(_onDiaryPageEdited); // da visualizzazione -> editing
    on<DiaryPageSaved>(_onDiaryPageSaved); // da editing, salvataggio su isar e poi in visualizzazione
  }

  Future<void> _onDiaryPageLoaded(DiaryPageLoaded event, Emitter<DiaryPageState> emit) async{
    if(event.page == null){
      emit(const DiaryPageState.editing());
    } else {
      emit(DiaryPageState.reading(page: event.page!));
    }
  }

  Future<void> _onDiaryPageViewed(DiaryPageViewed event, Emitter<DiaryPageState> emit) async{
    emit(DiaryPageState.reading(page: event.page));
  }

  Future<void> _onDiaryPageEdited(DiaryPageEdited event, Emitter<DiaryPageState> emit) async{
    emit(DiaryPageState.editing(page: event.page));
  }

  Future<void> _onDiaryPageSaved(DiaryPageSaved event, Emitter<DiaryPageState> emit) async{
    final Isar? _isar = Isar.getInstance();

    if(_isar == null){
      return emit(const DiaryPageState.error());
    }

    await _isar.writeTxn(() => _isar.diaryPages.put(event.page));
  }

}