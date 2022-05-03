// Import
import 'dart:math';

// Image utility class
abstract class ImageUtils {
  static final random = Random();

  static String generateRandomImage() {
    final seed = random.nextInt(1000);
    return 'https://picsum.photos/seed/$seed/300/300';
  }
}
