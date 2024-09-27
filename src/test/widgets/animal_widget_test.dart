
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/widgets/animal_widget.dart';
import 'package:animal_switcher/models/animal_model.dart';

void main() {
	group('AnimalWidget Tests', () {
		testWidgets('displays cat text and icon initially', (WidgetTester tester) async {
			// Arrange
			final animal = Animal(text: 'Cat', icon: Icon(Icons.pets));

			// Act
			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: AnimalWidget(animal: animal),
				),
			));

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.pets), findsOneWidget);
		});

		testWidgets('displays dog text and icon when animal state changes', (WidgetTester tester) async {
			// Arrange
			final animal = Animal(text: 'Dog', icon: Icon(Icons.person));

			// Act
			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: AnimalWidget(animal: animal),
				),
			));

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
