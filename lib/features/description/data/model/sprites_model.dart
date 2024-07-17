import 'package:pokedex/features/description/data/model/other_sprite_model.dart';
import 'package:pokedex/features/description/domain/entity/sprites.dart';

class SpritesModel extends Sprites {
  SpritesModel({
    required super.id,
    required super.frontDefault,
    required super.frontShiny,
    required super.frontFemale,
    required super.frontShinyFemale,
    required super.backDefault,
    required super.backShiny,
    required super.backFemale,
    required super.backShinyFemale,
    required super.others,
  });
  factory SpritesModel.fromJson(json) => SpritesModel(
        id: json['id'],
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
        frontFemale: json['front_female'],
        frontShinyFemale: json['front_shiny_female'],
        backDefault: json['back_default'],
        backShiny: json['back_shiny'],
        backFemale: json['back_female'],
        backShinyFemale: json['back_shiny_female'],
        others: OtherSpriteModel.fromJson(json['others']),
      );
}
