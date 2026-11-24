import 'package:flutter_test/flutter_test.dart';
import 'package:singilicious/main.dart';

void main() {
  testWidgets('Singilicious Home Dashboard test', (WidgetTester tester) async {
    await tester.pumpWidget(const SingiliciousApp());

    expect(find.text('singilicious.'), findsOneWidget);
    expect(find.text('Total group expenses'), findsOneWidget);
    expect(find.text('My groups'), findsOneWidget);
  });
}
