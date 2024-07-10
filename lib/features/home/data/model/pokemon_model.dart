import 'package:pokedex/core/utils/functions/captalize_first_letter.dart';
import 'package:pokedex/features/home/data/model/pokemon_type_model.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.defaultImageUrl,
    required super.imageUrlShiny,
    required super.artworkImageUrl,
    required super.isMega,
    required super.pokemonTypes,
  });
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: capitalize(json['pokemon']['name']),
      defaultImageUrl: json['sprites']['front_default'],
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${json['id']}.png",
      imageUrlShiny: json['sprites']['front_shiny'],
      isMega: json['is_mega'],
      artworkImageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id']}.png",
      pokemonTypes: (json['types'] as List)
          .map((e) => PokemonTypeModel.fromJson(e))
          .toList(),
    );
  }
}
