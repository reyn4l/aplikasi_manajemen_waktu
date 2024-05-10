// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:aplikasi_manajemen_waktu/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnalogClock UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AnalogClock()));

    // Verify that AnalogClock widget is rendered
    expect(find.byType(AnalogClock), findsOneWidget);

    // Verify that AppBar title is rendered
    expect(find.text('Analog Clock'), findsOneWidget);

    // Verify that FloatingActionButton is rendered
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('AnalogClock Timer Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AnalogClock()));

    // Get initial time
    final initialText =
        tester.widget<Text>(find.byKey(Key('analog_clock_text'))).data;

    // Advance time by 1 second
    await tester.pump(Duration(seconds: 1));

    // Get time after 1 second
    final afterOneSecondText =
        tester.widget<Text>(find.byKey(Key('analog_clock_text'))).data;

    // Verify that time is updated after 1 second
    expect(initialText, isNot(afterOneSecondText));
  });
}
