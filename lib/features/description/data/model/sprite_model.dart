import 'package:pokedex/features/description/domain/entity/sprites.dart';

class SpriteModel extends Sprites {
  SpriteModel({
    required super.backDefault,
    required super.backShiny,
    required super.frontDefault,
    required super.frontShiny,
    required super.other,
    super.backFemale,
    super.backShinyFemale,
    super.frontFemale,
    super.frontShinyFemale,
  });

  factory SpriteModel.fromJson(Map<String, dynamic> json) {
    return SpriteModel(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      other: OtherSpritesModel.fromJson(json['other']),
    );
  }
}

class OtherSpritesModel extends OtherSprites {
  OtherSpritesModel({
    required super.dreamWorld,
    required super.home,
    required super.officialArtwork,
    required super.showdown,
  });
  factory OtherSpritesModel.fromJson(Map<String, dynamic> json) {
    return OtherSpritesModel(
      dreamWorld: DreamWorldModel.fromJson(json['dream_world']),
      home: HomeSpritesModel.fromJson(json['home']),
      officialArtwork: OfficialArtworkModel.fromJson(json['official-artwork']),
      showdown: ShowdownModel.fromJson(json['showdown']),
    );
  }
}

class HomeSpritesModel extends HomeSprites {
  HomeSpritesModel({
    required super.frontDefault,
    super.frontFemale,
    required super.frontShiny,
    super.frontShinyFemale,
  });

  factory HomeSpritesModel.fromJson(Map<String, dynamic> json) {
    return HomeSpritesModel(
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
    );
  }
}

class DreamWorldModel extends DreamWorld {
  DreamWorldModel({
    required super.frontDefault,
    super.frontFemale,
  });

  factory DreamWorldModel.fromJson(Map<String, dynamic> json) {
    return DreamWorldModel(
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
    );
  }
}

class OfficialArtworkModel extends OfficialArtwork {
  OfficialArtworkModel({
    required super.frontDefault,
    required super.frontShiny,
  });

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json['front_default'],
      frontShiny: json['front_shiny'],
    );
  }
}

class ShowdownModel extends Showdown {
  ShowdownModel({
    required super.backDefault,
    super.backFemale,
    required super.backShiny,
    super.backShinyFemale,
    required super.frontDefault,
    super.frontFemale,
    required super.frontShiny,
    super.frontShinyFemale,
  });

  factory ShowdownModel.fromJson(Map<String, dynamic> json) {
    return ShowdownModel(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
    );
  }
}
