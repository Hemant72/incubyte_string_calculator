import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test('empty string returns zero', () {
    expect(calculator.add(""), equals(0));
  });

  test('single number returns that number', () {
    expect(calculator.add("1"), equals(1));
    expect(calculator.add("5"), equals(5));
    expect(calculator.add("42"), equals(42));
  });

  test('two numbers returns their sum', () {
    expect(calculator.add("1,2"), equals(3));
    expect(calculator.add("5,7"), equals(12));
    expect(calculator.add("10,20"), equals(30));
  });

  
  test('multiple numbers returns their sum', () {
    expect(calculator.add("1,2,3"), equals(6));
    expect(calculator.add("5,7,8,10"), equals(30));
    expect(calculator.add("1,2,3,4,5"), equals(15));
  });
}
