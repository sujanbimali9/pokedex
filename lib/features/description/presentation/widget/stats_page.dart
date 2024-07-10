import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/color/type_color.dart';
import 'package:pokedex/features/description/domain/entity/stats.dart';
import 'package:pokedex/features/description/domain/entity/type.dart';
import 'package:pokedex/features/description/presentation/widget/pokemon_stats.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key, this.pokemonStats, required this.pokemonType});
  final List<Stat>? pokemonStats;
  final PokemonType pokemonType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (pokemonStats != null)
          ...List.generate(
            pokemonStats!.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: PokemonStats(
                  indicatorColor:
                      PokemonTypeColor.getColorForType(pokemonType.name),
                  statName: pokemonStats![index].name,
                  statValue: pokemonStats![index].baseStat,
                  textColor: Colors.black),
            ),
          )
        else
          ...List.generate(
            7,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: PokemonStats(
                statName: 'Attack',
                textColor: Colors.black,
                indicatorColor: Colors.red,
              ),
            ),
          )
      ],
    );
  }
}
