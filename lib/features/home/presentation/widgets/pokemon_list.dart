import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:pokedex/features/home/presentation/widgets/pokemon_card.dart';

class PokemonLists extends StatelessWidget {
  const PokemonLists({
    required this.pokemons,
    super.key,
    required this.scrollController,
    this.fetchingMore = false,
  });
  final List<Pokemon> pokemons;
  final ScrollController scrollController;
  final bool fetchingMore;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.read<HomeBloc>().add(FetchPokemons(limit: 20, offset: 0));
        return Future.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverGrid.builder(
            addAutomaticKeepAlives: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.55,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              if (index == pokemons.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return PokemonCard(pokemons: pokemons, index: index);
            },
          ),
          if (fetchingMore)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
