import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumyumnavigator/src/core/widget/annotated_scaffold.dart'; 

void main() {
  testWidgets('AnnotatedScaffold wraps child with Scaffold and AnnotatedRegion', (WidgetTester tester) async {
    const testKey = Key('testChild');

    await tester.pumpWidget(MaterialApp(
      home: AnnotatedScaffold(
        child: Placeholder(key: testKey),
      ),
    ));

    // Verify that the child is wrapped with Scaffold
    expect(find.byType(Scaffold), findsOneWidget);

    // Verify that the child is wrapped with AnnotatedRegion<SystemUiOverlayStyle>
    expect(find.byType(AnnotatedRegion<SystemUiOverlayStyle>), findsOneWidget);

    // Verify that the child widget is present
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('AnnotatedScaffold sets SystemUiOverlayStyle to light', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AnnotatedScaffold(
        child: const Placeholder(),
      ),
    ));

    final annotatedRegion = tester.widget<AnnotatedRegion<SystemUiOverlayStyle>>(
      find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
    );

    // Verify that the SystemUiOverlayStyle is set to light
    expect(annotatedRegion.value, SystemUiOverlayStyle.light);
  });
}
