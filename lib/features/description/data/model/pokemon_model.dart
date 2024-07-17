import 'package:pokedex/features/description/data/model/ability_model.dart';
import 'package:pokedex/core/models/pokemon_type_model.dart';
import 'package:pokedex/features/description/data/model/evolution_chain_model.dart';
import 'package:pokedex/features/description/data/model/sprites_model.dart';
import 'package:pokedex/features/description/data/model/stat_model.dart';
import 'package:pokedex/features/description/domain/entity/pokemon.dart';

class PokemonDetailModel extends PokemonDetail {
  PokemonDetailModel({
    required super.id,
    required super.name,
    required super.height,
    required super.weight,
    required super.baseExperience,
    required super.baseHappiness,
    required super.eggGroup,
    required super.habitat,
    required super.gender,
    required super.growthRate,
    required super.isLegendary,
    required super.isMythical,
    required super.shape,
    required List<StatModel> super.stats,
    required List<PokemonTypeModel> super.types,
    required List<AbilityModel> super.abilities,
    required super.flavourText,
    required super.evolutionChain,
    required super.genre,
    required super.sprites,
  });

  factory PokemonDetailModel.fromJson(json) {
    return PokemonDetailModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      baseExperience: json['base_experience'],
      baseHappiness: json['base_happiness'],
      eggGroup: List<String>.from(json['egg_group']),
      habitat: json['habitat'],
      growthRate: json['growth_rate'],
      isLegendary: json['is_legendary'] as bool? ?? false,
      isMythical: json['is_mythical'] as bool? ?? false,
      shape: json['shape'],
      stats: json['stats']
          ?.map<StatModel>((stat) => StatModel.fromJson(stat))
          .toList(),
      types: json['types']
          ?.map<PokemonTypeModel>((e) => PokemonTypeModel.fromJson(e))
          .toList(),
      abilities: json['abilities']
          ?.map<AbilityModel>((ability) => AbilityModel.fromJson(ability))
          .toList(),
      flavourText: List<String>.from(json['flavour_text'] ?? []),
      evolutionChain: json['evolution_chain'].isNotEmpty
          ? EvolutionChainModel.fromJson(json['evolution_chain'])
          : null,
      genre: json['genre'],
      sprites: SpritesModel.fromJson(json['pokemon_sprites']),
      gender: json['gender'],
    );
  }
}
