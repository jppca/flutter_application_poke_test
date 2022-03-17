import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//My imports
import 'package:flutter_application_poke_test/widgets/widget_custon_input.dart';
import 'package:flutter_application_poke_test/widgets/widget_title.dart';
import 'package:flutter_application_poke_test/main.dart';

void main() {
  //Some widget tests
  testWidgets('Test for title widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Wtitle(
      title: "POKÉ",
      titleExt: "TEST",
    )));
    final titleFinder = find.text('POKÉ');
    final titleExtFinder = find.text('TEST');
    expect(titleFinder, findsOneWidget);
    expect(titleExtFinder, findsOneWidget);
  });

  testWidgets('Test for custon input widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WCustonInput(
              icon: Icons.email,
              placeholder: 'Correo',
              textcontroller: TextEditingController()),
        ),
      ),
    );
    final placeholderFinder = find.text('Correo');
    final iconFinder = find.byIcon(Icons.email);
    expect(placeholderFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('Construction of the complete App', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
