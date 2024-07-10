import 'package:pokedex/features/description/domain/entity/type.dart';

class PokemonTypeModel extends PokemonType {
  PokemonTypeModel({
    required super.slot,
    required super.name,
  });

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      slot: json['slot'],
      name: json['type']['name'],
    );
  }
}
