import 'constants.dart';
import 'dart:math';

class ProductUtils {
  List<int> getFactors() {
    int min = 2;
    int max = 30;
    Random rand = Random();
    return [min + rand.nextInt(max - min), min + rand.nextInt(max - min)];
  }

  List<Map<String, Object>> getProductList(List<int> factors) {
    int a = factors[0];
    int b = factors[1];
    int correct = a * b;
    int wrong1 = (a - 1) * b;
    int wrong2 = a * (b + 1);
    int wrong3 = (a + 1) * (b - 1);
    int wrong4 = (a - 1) * (b - 1);
    int wrong5 = (a + 1) * (b + 1);

    List<Map<String, Object>> list = [
      {Constants.CORRECT_KEY: true, Constants.ANSWER_KEY: correct},
      {Constants.CORRECT_KEY: false, Constants.ANSWER_KEY: wrong1},
      {Constants.CORRECT_KEY: false, Constants.ANSWER_KEY: wrong2},
      {Constants.CORRECT_KEY: false, Constants.ANSWER_KEY: wrong3},
      {Constants.CORRECT_KEY: false, Constants.ANSWER_KEY: wrong4},
      {Constants.CORRECT_KEY: false, Constants.ANSWER_KEY: wrong5},
    ];

    return shuffle(list);
  }

  List<Map<String, Object>> shuffle(List<Map<String, Object>> items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }
}
