import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';
import 'package:image_picker/image_picker.dart';
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
    on<DiaryPageImageAdded>(_onDiaryPageImageAdded);
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

  Future<void> _onDiaryPageImageAdded(DiaryPageImageAdded event, Emitter<DiaryPageState> emit) async{
    final currentState = state;
    if(currentState.status == DiaryPageStatus.reading){ //Per semplificazione
      try{
        final picker = ImagePicker();
        final pickedImage = await picker.pickImage(source: ImageSource.gallery);

        if(pickedImage != null){
          final filename = pickedImage.name;
          final imageFile = File(pickedImage.path);
          final firebaseStorage = FirebaseStorage.instance.ref();
          final uploadedFile = await firebaseStorage.child('/${event.page.dateTime.millisecondsSinceEpoch}/$filename').putFile(imageFile);
          print("upload file state is: ${uploadedFile.state.name}");
          emit(DiaryPageState.reading(page: event.page.copyWith(images: (event.page.images ?? []) + [await uploadedFile.ref.getDownloadURL()])));
        }
      }
      catch(e){
        emit(const DiaryPageState.error());
      }
    }




  }

  Future<void> _onDiaryPageSaved(DiaryPageSaved event, Emitter<DiaryPageState> emit) async{
    final firebaseDb = FirebaseDatabase.instance.ref();

    final diaryPages = firebaseDb.child('diaryPages');
    await diaryPages.push().set(event.page.toRTDB());

    /*final Isar? _isar = Isar.getInstance();

    if(_isar == null){
      return emit(const DiaryPageState.error());
    }

    await _isar.writeTxn(() => _isar.diaryPages.put(event.page));*/
    emit(DiaryPageState.reading(page: event.page));
  }

}