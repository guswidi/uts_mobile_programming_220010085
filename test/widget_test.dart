import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:uts_mobile_programming_220010085/main.dart';

void main() {
  testWidgets('Country List Page loads successfully', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the initial page contains the title 'Daftar Negara'.
    expect(find.text('Daftar Negara'), findsOneWidget);
  });
}
