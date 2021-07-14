// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_case_demo/main.dart';

import '../lib/login_page.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    LoginDesign loginPage = new LoginDesign();
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    Finder emailField = find.byKey(new Key('email'));
    await tester.enterText(emailField, "text");
    // tap on the login button
    Finder loginButton = find.byKey(new Key('login_btn'));
    await tester.tap(loginButton);
    await tester.pump();
    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
