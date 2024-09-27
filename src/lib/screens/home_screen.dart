
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.animal_switcher/cubits/animal_cubit.dart';
import 'package:com.example.animal_switcher/widgets/animal_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal Switcher'),
			),
			body: Center(
				child: GestureDetector(
					onTap: () {
						context.read<AnimalCubit>().switchAnimal();
					},
					child: BlocBuilder<AnimalCubit, AnimalState>(
						builder: (context, state) {
							return AnimalWidget(animal: state.animal);
						},
					),
				),
			),
		);
	}
}
