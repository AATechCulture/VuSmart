// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parentapp/main.dart';

void main() {
    testWidgets('App smoke test', (WidgetTester tester) async {
      await tester.pumpWidget(const ParentApp());
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Bottom navigation test', (WidgetTester tester) async {
      await tester.pumpWidget(const ParentApp());
    
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
      expect(find.byIcon(Icons.restaurant_menu), findsOneWidget);
      expect(find.byIcon(Icons.account_balance), findsOneWidget);
      expect(find.byIcon(Icons.map), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('Navigation interaction test', (WidgetTester tester) async {
      await tester.pumpWidget(const ParentApp());
    
      await tester.tap(find.byIcon(Icons.restaurant_menu));
      await tester.pumpAndSettle();
    
      await tester.tap(find.byIcon(Icons.account_balance));
      await tester.pumpAndSettle();
    });
}