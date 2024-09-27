
import 'package:flutter/material.dart';
import 'package:animal_switcher/models/animal_model.dart';

class AnimalWidget extends StatelessWidget {
	final Animal animal;

	AnimalWidget({required this.animal});

	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				Text(animal.text),
				SizedBox(width: 8.0),
				animal.icon,
			],
		);
	}
}
