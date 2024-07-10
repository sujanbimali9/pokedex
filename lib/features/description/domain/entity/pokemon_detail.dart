import 'package:pokedex/features/description/domain/entity/ability.dart';
import 'package:pokedex/features/description/domain/entity/evolution.dart';
import 'package:pokedex/features/description/domain/entity/species.dart';
import 'package:pokedex/features/description/domain/entity/sprites.dart';
import 'package:pokedex/features/description/domain/entity/stats.dart';
import 'package:pokedex/features/description/domain/entity/type.dart';

class PokemonDetail {
  final String name;
  final int height;
  final int weight;
  final int id;
  final Sprites sprites;
  final List<Ability> ability;
  final List<Stat> stat;
  final List<PokemonType> type;
  final EvolutionChain evolutionChain;
  final Species species;

  PokemonDetail({
    required this.name,
    required this.height,
    required this.weight,
    required this.id,
    required this.sprites,
    required this.ability,
    required this.stat,
    required this.type,
    required this.evolutionChain,
    required this.species,
  });
}
