import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

void main() {
  //given when then..

  //Pretest
  setUp(() => null);        //setUp is called before the test is done.
  setUpAll(() => null);     //SetupAll is called before all the test
  //Setup -> test -> setup -> test -> setup -> test
  //Setupall -> test -> test -> test

  late Counter counter;
  setUpAll(() {
    counter = Counter();
  });

  group('Counter class - ', () {
    //arrange
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

          test("given a counter class the decremented value should decrement by 1",
              (){
                counter.decrementCounter();
                final value = counter.count;
                expect(value, 0);
              }
              );

          test("This test will reset the value of the UI", () {
            counter.resetCounter();
            final value = counter.count;
            expect(value, 0);
          });
        // );
    });

  //Post test
  tearDown(() => null);  //called after a single test
  tearDownAll(() => null);    // called after all the test

  // -> test -> tearDown ->test -> tearDown
  // -> test -> test -> test -> tearDownAll


}