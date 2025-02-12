class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = '[,\n]';
    String numbersToProcess = numbers;

    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      if (delimiterEnd != -1) {
        delimiter = RegExp.escape(numbers.substring(2, delimiterEnd));
        numbersToProcess = numbers.substring(delimiterEnd + 1);
      }
    }

    if (numbersToProcess.contains(RegExp(delimiter))) {
      List<int> nums = numbersToProcess
          .split(RegExp(delimiter))
          .map((val) => int.parse(val.trim()))
          .toList();

      List<int> negativeNumbers = nums.where((n) => n < 0).toList();
      if (negativeNumbers.isNotEmpty) {
        throw NegativeNumbersException(negativeNumbers);
      }

      return nums.reduce((sum, val) => sum + val);
    }

    final number = int.parse(numbersToProcess);
    if (number < 0) {
      throw NegativeNumbersException([number]);
    }
    return number;
  }
}

class NegativeNumbersException implements Exception {
  final List<int> negativeNumbers;

  NegativeNumbersException(this.negativeNumbers);

  @override
  String toString() {
    return 'negatives not allowed: ${negativeNumbers.join(", ")}';
  }
}
