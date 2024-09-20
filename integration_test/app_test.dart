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

    // Verify that we're on the Workout List Screen
    expect(find.text('Workout List'), findsOneWidget);

    // Tap the 'New Workout' button (FloatingActionButton)
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify that we've navigated to the Workout Details Screen
    expect(find.text('Workout Details'), findsOneWidget);

    // Tap the 'Add Set' button to add a new set
    await tester.tap(find.text('Add Set'));
    await tester.pumpAndSettle();

    // Verify that we're on the Add Set Screen
    expect(find.text('Add Set'), findsAny);

    // Now, enter the set details

    // Enter Exercise Name (assuming there's a dropdown or text field)
    // For a dropdown, select an exercise
    // For example, if there's a DropdownButtonFormField for exercises:
    await tester.tap(find.byKey(const Key('exercise_dropdown')));
    await tester.pumpAndSettle();

    // Select the exercise from the dropdown list
    await tester.tap(find.text('Bench Press').last);
    await tester.pumpAndSettle();

    // Enter weight
    await tester.enterText(find.byKey(const Key('weight_field')), '100');
    await tester.pumpAndSettle();

    // Enter repetitions
    await tester.enterText(find.byKey(const Key('reps_field')), '10');
    await tester.pumpAndSettle();

    // Tap the 'Add Set' button to save the set
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add Set'));
    await tester.pumpAndSettle();

    // Back on the Workout Details Screen, tap 'Save Workout' to save the workout
    await tester.tap(find.widgetWithText(ElevatedButton, 'Save Workout'));
    await tester.pumpAndSettle();

    // Verify that the new workout appears in the list
    expect(find.byType(ListTile), findsOneWidget);

    // Now, delete the workout

    // Tap the delete icon on the workout list item
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Confirm deletion by tapping 'Delete' in the dialog
    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();

    // Verify that the list is empty
    expect(find.byType(ListTile), findsNothing);
  });
}
