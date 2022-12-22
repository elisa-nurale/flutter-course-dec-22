import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_dec_22/models/diary_page.dart';
import 'package:isar/isar.dart';
import 'diary_state.dart';
import 'diary_event.dart';
import 'package:injectable/injectable.dart';

@injectable
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(const DiaryState.notLoaded()){
    on<DiaryPagesLoaded>(_onDiaryPagesLoaded);
  }

  Future<void> _onDiaryPagesLoaded(DiaryPagesLoaded event, Emitter<DiaryState> emit) async{
      emit(const DiaryState.loading());


      //final Isar isar = Isar.getInstance() ?? await Isar.open([DiaryPageSchema]);
      //final pages = await isar.diaryPages.where().findAll();

      final firebaseStorage = FirebaseStorage.instance.ref();
      final firebaseDB = FirebaseDatabase.instance.ref();
      final diaryPages = firebaseDB.child('diaryPages');
      final pagesMap = ((await diaryPages.get()).value ?? {}) as Map;

      List<DiaryPage> pages = [];
      await Future.forEach(pagesMap.values, (page) async {
        var diaryPage = DiaryPage.fromRTDB(page as Map);

        List<String> images = [];
        final imagesList = await firebaseStorage.child('/${diaryPage.dateTime.millisecondsSinceEpoch}').listAll();
        for (var image in imagesList.items){
          images.add(await image.getDownloadURL());
        }

        diaryPage = diaryPage.copyWith(images: images);
        pages.add(diaryPage);
      });
      emit(DiaryState.loaded(pages));
  }
}