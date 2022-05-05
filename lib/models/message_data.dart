// Import
import 'package:meta/meta.dart';

// Message data class
@immutable
class MessageData {
  const MessageData({
    required this.senderName,
    required this.message,
    required this.date,
    required this.dateMessage,
    required this.avatarUrl,
  });

  final String senderName;
  final String message;
  final DateTime date;
  final String dateMessage;
  final String avatarUrl;
}
