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

  test('numbers with newline delimiter returns their sum', () {
    expect(calculator.add("1\n2,3"), equals(6));
    expect(calculator.add("1\n2\n3"), equals(6));
    expect(calculator.add("1,2\n3,4"), equals(10));
  });

  test('custom delimiter returns sum', () {
    expect(calculator.add("//;\n1;2"), equals(3));
    expect(calculator.add("//*\n1*2*3"), equals(6));
    expect(calculator.add("//:\n1:2:3:4"), equals(10));
    expect(calculator.add("//&\n1&2&3"), equals(6));
  });

  group('negative numbers', () {
    test('single negative number throws exception', () {
      expect(
          () => calculator.add("-1"),
          throwsA(isA<NegativeNumbersException>().having(
              (e) => e.toString(), 'message', 'negatives not allowed: -1')));
    });

    test('multiple negative numbers throws exception with all negatives', () {
      expect(
          () => calculator.add("1,-2,3,-4,5,-6"),
          throwsA(isA<NegativeNumbersException>().having((e) => e.toString(),
              'message', 'negatives not allowed: -2, -4, -6')));
    });

    test('negative numbers with custom delimiter throws exception', () {
      expect(
          () => calculator.add("//;\n1;-2;3;-4"),
          throwsA(isA<NegativeNumbersException>().having((e) => e.toString(),
              'message', 'negatives not allowed: -2, -4')));
    });
  });
}
