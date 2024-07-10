import 'package:pokedex/features/home/domain/entity/pokemon_types.dart';

class PokemonTypeModel extends PokemonType {
  PokemonTypeModel({required super.slot, required super.type});
  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      slot: json['slot'],
      type: TypeDetailModel.fromJson(json['type']),
    );
  }
}

class TypeDetailModel extends TypeDetail {
  TypeDetailModel({required super.name, required super.url});
  factory TypeDetailModel.fromJson(Map<String, dynamic> json) {
    return TypeDetailModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
