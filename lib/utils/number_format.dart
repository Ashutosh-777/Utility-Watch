  String formatNumberWithSpaces(int number) {
    String numberString = number.toString();
    String formattedString = '';

    int counter = 0;
    for (int i = numberString.length - 1; i >= 0; i--) {
      formattedString = numberString[i] + formattedString;
      counter++;
      if (i == numberString.length - 2) {
        counter++;
        continue;
      }
      if (counter % 2 == 0 && i != 0) {
        formattedString = ' $formattedString';
      }
    }

    return formattedString;
  }