// Import
import 'dart:math';

// Date utility class
abstract class BubbleDateUtils {
  static final random = Random();

  static DateTime generateRandomDate() {
    final seed = random.nextInt(604800);
    final now = DateTime.now();
    return now.subtract(Duration(seconds: seed));
  }
}
