// Import
import 'package:meta/meta.dart';

// Story data class
@immutable
class StoryData {
  const StoryData({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}
