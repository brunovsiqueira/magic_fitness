import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:magic_fitness/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app test', (WidgetTester tester) async {
    // Start the app
    app.main();

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Tap the 'New Workout' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Since the app navigates to a new screen, you can simulate filling out the form
    // and saving a new workout. For example:

    // Enter exercise details, assuming appropriate widgets are present
    await tester.enterText(find.byKey(const Key('weightField')), '100');
    await tester.enterText(find.byKey(const Key('repsField')), '10');

    // Tap the 'Save Workout' button
    await tester.tap(find.text('Save Workout'));
    await tester.pumpAndSettle();

    // Verify that the new workout appears in the list
    expect(find.byType(ListTile), findsOneWidget);

    // Delete the workout
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Confirm deletion
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    // Verify that the list is empty
    expect(find.byType(ListTile), findsNothing);
  });
}
