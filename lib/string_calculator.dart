class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    if (numbers.contains(',')) {
      List<String> parts = numbers.split(',');
      return int.parse(parts[0]) + int.parse(parts[1]);
    }
    
    return int.parse(numbers);
  }
}
