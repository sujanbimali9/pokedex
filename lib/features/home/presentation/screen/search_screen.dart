import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pokedex/features/home/presentation/widgets/pokemon_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    context.read<SearchBloc>().add(SearchPokemon(''));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      autofocus: true,
                      focusNode: FocusNode()..requestFocus(),
                      decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search Pokemon'),
                      onChanged: (value) {
                        context.read<SearchBloc>().add(SearchPokemon(value));
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.clear();
                        context.read<SearchBloc>().add(SearchPokemon(''));
                      },
                      icon: const Icon(Icons.clear))
                ],
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (previous, current) {
                    if (current is SearchLoaded) return true;
                    return false;
                  },
                  builder: (context, state) {
                    return GridView.builder(
                      itemCount: state.pokemons.length,
                      addAutomaticKeepAlives: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return PokemonCard(
                            pokemons: state.pokemons, index: index);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
