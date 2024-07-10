import 'package:pokedex/core/utils/functions/captalize_first_letter.dart';
import 'package:pokedex/features/description/domain/entity/stats.dart';

class StatModel extends Stat {
  StatModel({
    required super.baseStat,
    required super.effort,
    required super.name,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
        baseStat: json['base_stat'],
        effort: json['effort'],
        name: capitalize(
          json['stat']['name'],
        ));
  }
}
