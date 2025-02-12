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
      return numbersToProcess
          .split(RegExp(delimiter))
          .map((val) => int.parse(val.trim()))
          .reduce((sum, val) => sum + val);
    }

    return int.parse(numbersToProcess);
  }
}
