// Import
import 'package:flutter_test/flutter_test.dart';
import 'package:bubble/main.dart';

// Main function
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
