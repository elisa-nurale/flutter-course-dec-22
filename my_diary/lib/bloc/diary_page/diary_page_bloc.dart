import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_page_event.dart';
import 'diary_page_state.dart';

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

}