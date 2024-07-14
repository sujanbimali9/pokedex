import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/features/description/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex/features/home/presentation/screen/home.dart';
import 'package:pokedex/dependency.dart';

void main() {
  initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocater<HomeBloc>()),
        BlocProvider(create: (context) => serviceLocater<PokemonDetailBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

final pokemon = [
  'Grass',
  '2`3.6*(0.7m)',
  '15.2 lbs(6.9 kg)',
  'Overgrow, Chlorophyll',
];

final pokemonDetails = ['Species', 'Height', 'Weight', 'Abilities'];
final types = ['Grass', 'Poison'];
final breeding = ['Gender', 'Egg Group', 'Edd Cycle'];
final breeding2 = ['87.5%   12.5%', 'Monster', 'Grass'];
final tab = ['About', 'Base Stats', 'Evolution', 'Moves'];
final list = ['About', 'Evolution', 'Stats'];
