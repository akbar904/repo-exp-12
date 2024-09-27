
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/main.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('Main', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('renders the HomeScreen', (tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: animalCubit,
					child: MyApp(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('switches to Dog when text is tapped', (tester) async {
			whenListen(
				animalCubit,
				Stream.fromIterable([
					AnimalState(text: 'Cat', icon: Icons.access_time),
					AnimalState(text: 'Dog', icon: Icons.person),
				]),
				initialState: AnimalState(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: animalCubit,
					child: MyApp(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
