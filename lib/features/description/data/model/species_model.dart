import 'package:pokedex/features/description/domain/entity/species.dart';

class SpeciesModel extends Species {
  SpeciesModel({
    required super.baseHappiness,
    required super.habitat,
    required super.eggGroups,
    required super.growthRate,
    required super.isLegendary,
    required super.isMythical,
    required super.isBaby,
    required super.shape,
    required super.genere,
    required super.flavorTexts,
    required super.color,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    String genreEn = "";
    if (json['genera'] != null) {
      for (var genus in json['genera']) {
        if (genus['language']['name'] == 'en') {
          genreEn = genus['genus'];
          break;
        }
      }
    }

    return SpeciesModel(
      baseHappiness: json['base_happiness'] ?? 0,
      habitat: json['habitat']['name'] ?? '',
      eggGroups: json['egg_groups'] != null
          ? List<String>.from(json['egg_groups'].map((eg) => eg['name']))
          : [],
      growthRate: json['growth_rate']['name'] ?? '',
      isLegendary: json['is_legendary'] ?? false,
      isMythical: json['is_mythical'] ?? false,
      isBaby: json['is_baby'] ?? false,
      shape: json['shape']['name'] ?? '',
      genere: genreEn,
      flavorTexts: json['flavor_text_entries'] != null
          ? List<String>.from((json['flavor_text_entries'] as List)
              .where((entry) => entry['language']['name'] == 'en')
              .map((entry) => entry['flavor_text']))
          : [],
      color: json['color']['name'] ?? '',
    );
  }
}
