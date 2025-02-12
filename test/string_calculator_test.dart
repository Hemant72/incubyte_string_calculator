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
}
