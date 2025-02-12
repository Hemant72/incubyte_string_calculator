class StringCalculator {
  static const int _maxAllowedNumber = 1000;

  List<String> _parseDelimiters(String delimiterSpec) {
    if (delimiterSpec.startsWith('[') && delimiterSpec.endsWith(']')) {
      List<String> delimiters = [];
      int startIndex = 0;

      while (startIndex < delimiterSpec.length) {
        int openBracket = delimiterSpec.indexOf('[', startIndex);
        if (openBracket == -1) break;

        int closeBracket = delimiterSpec.indexOf(']', openBracket);
        if (closeBracket == -1) break;

        String delimiter =
            delimiterSpec.substring(openBracket + 1, closeBracket);
        delimiters.add(RegExp.escape(delimiter));
        startIndex = closeBracket + 1;
      }

      return delimiters;
    } else {
      return [RegExp.escape(delimiterSpec)];
    }
  }

  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = '[,\n]';
    String numbersToProcess = numbers;

    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      if (delimiterEnd != -1) {
        List<String> delimiters =
            _parseDelimiters(numbers.substring(2, delimiterEnd));
        delimiter = delimiters.join('|');
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

      return nums
          .where((n) => n <= _maxAllowedNumber)
          .reduce((sum, val) => sum + val);
    }

    final number = int.parse(numbersToProcess);
    if (number < 0) {
      throw NegativeNumbersException([number]);
    }
    return number > _maxAllowedNumber ? 0 : number;
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
