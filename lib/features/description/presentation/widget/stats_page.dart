import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/features/description/domain/entity/stat.dart';
import 'package:pokedex/core/models/type.dart';
import 'package:pokedex/features/description/presentation/widget/pokemon_stats.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key, this.pokemonStats, required this.pokemonType});
  final List<Stat>? pokemonStats;
  final PokemonType pokemonType;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        if (pokemonStats != null)
          SliverList.builder(
              itemCount: pokemonStats!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: PokemonStats(
                      indicatorColor:
                          PokemonTypeColor.getColorForType(pokemonType.name),
                      statName: pokemonStats![index].name,
                      statValue: pokemonStats![index].baseStat,
                      textColor: Colors.black),
                );
              })
        else
          SliverList.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: PokemonStats(
                    statName: 'Attack',
                    textColor: Colors.black,
                    indicatorColor: Colors.red,
                  ),
                );
              }),
      ],
    );
  }
}
