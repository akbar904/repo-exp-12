
import 'package:flutter/material.dart';

class Animal {
	final String text;
	final Icon icon;

	Animal({required this.text, required this.icon});

	Map<String, dynamic> toMap() {
		return {
			'text': text,
			'icon': icon.icon?.codePoint,
		};
	}

	factory Animal.fromMap(Map<String, dynamic> map) {
		return Animal(
			text: map['text'],
			icon: Icon(IconData(map['icon'], fontFamily: 'MaterialIcons')),
		);
	}
}
