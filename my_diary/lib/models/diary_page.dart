import 'package:isar/isar.dart';
part 'diary_page.g.dart';

@collection
class DiaryPage{
  Id id = Isar.autoIncrement;
  final DateTime dateTime;
  final String content;
  final List<String>? images;
  DiaryPage({required this.dateTime, required this.content, this.images});

  DiaryPage copyWith({
    String? content,
    List<String>? images,
 }){
    return DiaryPage(
        dateTime: dateTime,
        content: content ?? this.content,
        images: images ?? this.images
    )..id = id;
  }

  Map<String, dynamic> toRTDB(){
    return {'datetime': dateTime.millisecondsSinceEpoch, 'content': content};
  }

  factory DiaryPage.fromRTDB(Map data){
    return DiaryPage(
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['datetime']),
        content: data['content']);
  }

  @override
  String toString() {
    return "'datetime': ${dateTime.millisecondsSinceEpoch}, 'images': ${images?.length},'content': $content";
  }
}