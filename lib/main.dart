import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/.keys.dart';

import 'package:pokedex/features/description/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex/features/home/presentation/bloc/filter_cubit/filter_bloc_cubit.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pokedex/features/home/presentation/screen/home.dart';
import 'package:pokedex/dependency.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocater<FilterCubit>()),
        BlocProvider(
            create: (context) => HomeBloc(serviceLocater(), serviceLocater(),
                context.read<FilterCubit>())),
        BlocProvider(create: (context) => serviceLocater<PokemonDetailBloc>()),
        BlocProvider(create: (context) => serviceLocater<SearchBloc>()),
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

final tab = ['About', 'Base Stats', 'Evolution'];
