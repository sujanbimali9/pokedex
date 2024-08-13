import 'package:flutter/material.dart';
import 'package:pokedex/features/description/domain/entity/pokemon.dart';
import 'package:pokedex/features/description/presentation/widget/evolution_card.dart';

class PersistanceTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final double max;
  final double min;

  PersistanceTabBarDelegate({
    required this.tabBar,
    this.max = kTextTabBarHeight,
    this.min = kTextTabBarHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor, child: tabBar);
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class EvolutionScreen extends StatelessWidget {
  const EvolutionScreen({super.key, this.pokemonDetail});
  final PokemonDetail? pokemonDetail;
  @override
  Widget build(BuildContext context) {
    final evolutions = pokemonDetail?.evolutionChain?.evolutions;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Text(
                  'Evolution',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                if (evolutions != null && evolutions.isNotEmpty)
                  for (var evolution in evolutions)
                    EvolutionCard(evolution: evolution)
                else
                  const Text('No Evolution Data Found')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
