import 'package:flutter_course_dec_22/models/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Counter class test', () {
    test('Il valore iniziare di counter è 0', (){
      final counter = Counter();
      expect(counter.value, 0);
    });

    test('Increment aumenta di uno il valore di counter', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('Decrement diminuisce di uno il valore di counter', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });

}