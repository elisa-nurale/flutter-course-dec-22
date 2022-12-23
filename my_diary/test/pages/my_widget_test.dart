import 'package:flutter_course_dec_22/pages/my_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Il widget ha un titolo e un messaggio', (tester) async {
    tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}