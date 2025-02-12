class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    if (numbers.contains(',')) {
      return numbers
          .split(',')
          .map((val) => int.parse(val))
          .reduce((sum, val) => sum + val);
    }

    return int.parse(numbers);
  }
}
