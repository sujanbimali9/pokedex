import 'package:pokedex/features/description/domain/entity/ability.dart';
import 'package:pokedex/features/description/domain/entity/evolution_chain.dart';
import 'package:pokedex/features/description/domain/entity/sprites.dart';
import 'package:pokedex/features/description/domain/entity/stat.dart';
import 'package:pokedex/core/models/type.dart';

class PokemonDetail {
  final int id;
  final String name;
  final int height;
  final int weight;
  final int? baseExperience;
  final int? baseHappiness;
  final List<String>? eggGroup;
  final String? habitat;
  final String? gender;
  final String? growthRate;
  final bool isLegendary;
  final bool isMythical;
  final String? shape;
  final List<Stat> stats;
  final List<PokemonType> types;
  final List<Ability>? abilities;
  final List<String> flavourText;
  final EvolutionChain? evolutionChain;
  final String? genre;
  final Sprites sprites;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.baseHappiness,
    required this.eggGroup,
    required this.habitat,
    this.gender,
    required this.growthRate,
    required this.isLegendary,
    required this.isMythical,
    required this.shape,
    required this.stats,
    required this.types,
    required this.abilities,
    required this.flavourText,
    required this.evolutionChain,
    required this.genre,
    required this.sprites,
  });
}
