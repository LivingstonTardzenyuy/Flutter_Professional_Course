import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

void main() {
  //given when then..

  group('Counter class - ', () {
    //arrange
    final Counter counter = Counter();
    test('given a counter class when it is instantiated the value of count should be 0',
            () {
          //Act
          final value = counter.count;

          //Assert
          expect(value, 0);
        });

    test('given the counter class the incremented value should be 1',
            (){
          //arrange
          counter.incrementCounter();
          //act
          final value = counter.count;
          //Assert
          expect(value, 1);
        }
    );

    test('given counter class when it is decremented then the value reduces by 1', () {

    });

  });

}