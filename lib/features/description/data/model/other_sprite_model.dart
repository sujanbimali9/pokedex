import 'package:pokedex/features/description/domain/entity/sprites.dart';

class OtherSpriteModel extends OtherSprites {
  OtherSpriteModel({
    required super.id,
    required super.homeFrontShiny,
    required super.homeFrontFemale,
    required super.homeFrontDefault,
    required super.showdownBackShiny,
    required super.showdownBackFemale,
    required super.showdownFrontShiny,
    required super.showdownBackDefault,
    required super.showdownFrontFemale,
    required super.homeFrontShinyFemale,
    required super.showdownFrontDefault,
    required super.dreamWorldFrontFemale,
    required super.dreamWorldFrontDefault,
    required super.showdownBackShinyFemale,
    required super.showdownFrontShinyFemale,
    required super.officialArtworkFrontShiny,
    required super.officialArtworkFrontDefault,
  });
  factory OtherSpriteModel.fromJson(Map<String, dynamic> map) {
    return OtherSpriteModel(
      id: map['id'],
      homeFrontFemale: map['home_front_female'],
      homeFrontDefault: map['home_front_default'],
      homeFrontShiny: map['home_front_shiny'],
      homeFrontShinyFemale: map['home_front_shiny_female'],
      officialArtworkFrontShiny: map['official_artwork_front_shiny'],
      officialArtworkFrontDefault: map['official_artwork_front_default'],
      dreamWorldFrontFemale: map['dream_world_front_female'],
      dreamWorldFrontDefault: map['dream_world_front_default'],
      showdownBackShiny: map['showdown_back_shiny'],
      showdownBackFemale: map['showdown_back_female'],
      showdownFrontShiny: map['showdown_front_shiny'],
      showdownBackDefault: map['showdown_back_default'],
      showdownFrontDefault: map['showdown_front_default'],
      showdownBackShinyFemale: map['showdown_back_shiny_female'],
      showdownFrontShinyFemale: map['showdown_front_shiny_female'],
      showdownFrontFemale: map['showdown_front_female'],
    );
  }
}
