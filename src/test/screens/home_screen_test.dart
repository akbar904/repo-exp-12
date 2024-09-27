
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.animal_switcher/screens/home_screen.dart';
import 'package:com.example.animal_switcher/cubits/animal_cubit.dart';
import 'package:com.example.animal_switcher/models/animal_model.dart';
import 'package:com.example.animal_switcher/widgets/animal_widget.dart';

// Mock Cubit
class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays initial animal as Cat with clock icon', (tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(text: "Cat", icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => animalCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('switches animal to Dog with person icon on tap', (tester) async {
			whenListen(
				animalCubit,
				Stream.fromIterable([
					AnimalState(animal: Animal(text: "Cat", icon: Icons.access_time)),
					AnimalState(animal: Animal(text: "Dog", icon: Icons.person)),
				]),
			);

			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(text: "Cat", icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => animalCubit,
						child: HomeScreen(),
					),
				),
			);
			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
