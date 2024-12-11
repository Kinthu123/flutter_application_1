import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Import your app

void main() {
  testWidgets('HomeScreen shows To-Do List and has an add button',
      (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that "To-Do List" is displayed
    expect(find.text('To-Do List'), findsOneWidget);

    // Verify that the Floating Action Button (Add button) is present
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the Floating Action Button to navigate to CreateScreen
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify CreateScreen is displayed
    expect(find.text('Create Task'), findsOneWidget);
  });

  testWidgets('CreateScreen can create a task and return to HomeScreen',
      (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Navigate to CreateScreen
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Wait for CreateScreen

    // Enter text in the task title field
    await tester.enterText(find.byType(TextField), 'New Task');

    // Tap the "Create Task" button
    await tester.tap(find.text('Create Task'));
    await tester.pumpAndSettle(); // Wait for task to be created

    // Verify that the task appears in HomeScreen
    expect(find.text('New Task'), findsOneWidget);
  });
}
