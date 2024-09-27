
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/models/animal_model.dart';

void main() {
	group('Animal Model', () {
		test('should have correct properties for Cat', () {
			final cat = Animal(text: 'Cat', icon: Icon(Icons.pets));

			expect(cat.text, 'Cat');
			expect(cat.icon.icon, Icons.pets);
		});

		test('should have correct properties for Dog', () {
			final dog = Animal(text: 'Dog', icon: Icon(Icons.person));

			expect(dog.text, 'Dog');
			expect(dog.icon.icon, Icons.person);
		});

		test('should serialize and deserialize correctly', () {
			final animal = Animal(text: 'Cat', icon: Icon(Icons.pets));
			final map = animal.toMap();
			final newAnimal = Animal.fromMap(map);

			expect(newAnimal.text, animal.text);
			expect(newAnimal.icon.icon, animal.icon.icon);
		});
	});
}

class Animal {
	final String text;
	final Icon icon;

	Animal({required this.text, required this.icon});

	Map<String, dynamic> toMap() {
		return {
			'text': text,
			'icon': icon.icon.codePoint,
		};
	}

	factory Animal.fromMap(Map<String, dynamic> map) {
		return Animal(
			text: map['text'],
			icon: Icon(IconData(map['icon'], fontFamily: 'MaterialIcons')),
		);
	}
}
