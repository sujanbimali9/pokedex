import 'package:pokedex/features/home/domain/entity/pokemon_types.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String defaultImageUrl;
  final String artworkImageUrl;
  final String? imageUrlShiny;

  final bool isMega;
  final List<PokemonType> pokemonTypes;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.artworkImageUrl,
    required this.defaultImageUrl,
    this.imageUrlShiny,
    required this.isMega,
    required this.pokemonTypes,
  });
}
