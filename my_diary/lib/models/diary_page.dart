import 'package:isar/isar.dart';
part 'diary_page.g.dart';

@collection
class DiaryPage{
  Id id = Isar.autoIncrement;
  final DateTime dateTime;
  final String content;
  DiaryPage({required this.dateTime, required this.content});
}