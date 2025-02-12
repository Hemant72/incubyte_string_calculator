class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    if (numbers.contains(',') || numbers.contains('\n')) {
      return numbers
          .split(RegExp(r'[,\n]'))
          .map((val) => int.parse(val.trim()))
          .reduce((sum, val) => sum + val);
    }

    return int.parse(numbers);
  }
}
