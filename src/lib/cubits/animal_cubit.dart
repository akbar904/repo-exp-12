
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/models/animal_model.dart';

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState(animal: Animal(text: 'Cat', icon: Icon(Icons.pets))));

	void switchAnimal() {
		if (state.animal.text == 'Cat') {
			emit(AnimalState(animal: Animal(text: 'Dog', icon: Icon(Icons.person))));
		} else {
			emit(AnimalState(animal: Animal(text: 'Cat', icon: Icon(Icons.pets))));
		}
	}
}

class AnimalState {
	final Animal animal;

	AnimalState({required this.animal});

	@override
	bool operator ==(Object other) =>
		identical(this, other) ||
		other is AnimalState &&
		runtimeType == other.runtimeType &&
		animal == other.animal;

	@override
	int get hashCode => animal.hashCode;
}
