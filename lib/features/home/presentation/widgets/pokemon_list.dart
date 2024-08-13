import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/custom_shape/poke_ball.dart';
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
    final clipper = PokeBallClipper();
    return RefreshIndicator(
      onRefresh: () {
        context.read<HomeBloc>().add(FetchPokemons());
        return Future.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverGrid.builder(
            addAutomaticKeepAlives: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              // crossAxisCount: 2,
              childAspectRatio: 1.55,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              if (index == pokemons.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return PokemonCard(
                  pokemons: pokemons, index: index, clipper: clipper);
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
