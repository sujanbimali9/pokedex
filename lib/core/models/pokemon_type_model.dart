import 'package:pokedex/core/models/type.dart';

part 'pokemon_type_model.g.dart';

class PokemonTypeModel extends PokemonType {
  PokemonTypeModel({required super.name});
  factory PokemonTypeModel.fromJson(json) => _$PokemonTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeModelToJson(this);
}
