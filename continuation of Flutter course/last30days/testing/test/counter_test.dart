import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

void main() {
  //given when then..
  test('given a counter class when it is instantiated the value of count should be 0',
          () {
              //arrange
            final Counter counter = Counter();

            //Act
            final value = counter.count;

            //Assert
            expect(value, 0);
          });

  test('given the counter class the incremented value should be 1',
      (){
        //arrange
        final Counter counter = Counter();
        counter.incrementCounter();
        //act
        final value = counter.count;
        //Assert
        expect(value, 1);
      }
  );
}