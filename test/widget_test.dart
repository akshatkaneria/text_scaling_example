import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_scaling_example/main.dart';

void main() {
  testWidgets('Widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('This is a sample heading'), findsOneWidget);
    expect(find.text('This is a sample text 1.'), findsOneWidget);
    expect(find.text('This is a sample text 1.'), findsOneWidget);
    expect(find.byType(Slider), findsOneWidget);
  });
}
