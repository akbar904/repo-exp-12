
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is AnimalState(cat, Icons.pets)', () {
			expect(animalCubit.state, AnimalState(animal: Animal(text: 'Cat', icon: Icon(Icons.pets))));
		});

		blocTest<AnimalCubit, AnimalState>(
			'switchAnimal changes state from cat to dog',
			build: () => animalCubit,
			act: (cubit) => cubit.switchAnimal(),
			expect: () => [AnimalState(animal: Animal(text: 'Dog', icon: Icon(Icons.person)))]
		);

		blocTest<AnimalCubit, AnimalState>(
			'switchAnimal changes state from dog to cat',
			build: () => animalCubit,
			seed: () => AnimalState(animal: Animal(text: 'Dog', icon: Icon(Icons.person))),
			act: (cubit) => cubit.switchAnimal(),
			expect: () => [AnimalState(animal: Animal(text: 'Cat', icon: Icon(Icons.pets)))]
		);
	});
}
