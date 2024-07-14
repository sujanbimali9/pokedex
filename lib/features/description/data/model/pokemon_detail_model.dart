import 'package:pokedex/core/utils/functions/captalize_first_letter.dart';
import 'package:pokedex/features/description/data/model/ability_model.dart';
import 'package:pokedex/features/description/data/model/evolution_model.dart';
import 'package:pokedex/features/description/data/model/species_model.dart';
import 'package:pokedex/features/description/data/model/sprite_model.dart';
import 'package:pokedex/features/description/data/model/stat_model.dart';
import 'package:pokedex/features/description/data/model/type_model.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';

class PokemonDetailsModel extends PokemonDetail {
  PokemonDetailsModel({
    required super.name,
    required super.height,
    required super.weight,
    required super.id,
    required super.sprites,
    required super.ability,
    required super.stat,
    required super.type,
    required super.evolutionChain,
    required super.species,
  });
  factory PokemonDetailsModel.fromJson({
    required Map<String, dynamic> pokemonDetail,
    required Map<String, dynamic> evolutionChain,
    required Map<String, dynamic> species,
  }) {
    return PokemonDetailsModel(
      name: capitalize(pokemonDetail['name'] ?? ''),
      height: pokemonDetail['height'] ?? '',
      weight: pokemonDetail['weight'] ?? '',
      id: pokemonDetail['id'] ?? '',
      sprites: SpriteModel.fromJson(pokemonDetail['sprites']),
      ability: (pokemonDetail['abilities'] as List)
          .map((e) => AbilityModel.fromJson(e))
          .toList(),
      stat: (pokemonDetail['stats'] as List)
          .map((e) => StatModel.fromJson(e))
          .toList(),
      type: (pokemonDetail['types'] as List)
          .map((e) => PokemonTypeModel.fromJson(e))
          .toList(),
      evolutionChain: EvolutionChainModel.fromJson(
          evolutionChain, capitalize(pokemonDetail['name'] ?? '')),
      species: SpeciesModel.fromJson(species),
    );
  }
}
