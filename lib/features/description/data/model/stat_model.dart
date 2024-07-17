import 'package:pokedex/features/description/domain/entity/stat.dart';

class StatModel extends Stat {
  StatModel({required super.name, required super.baseStat});

  factory StatModel.fromJson(json) {
    return StatModel(
      name: json['name'] as String,
      baseStat: json['baseStat'] as int,
    );
  }
}
