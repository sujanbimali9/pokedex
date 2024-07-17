import 'package:pokedex/features/description/domain/entity/ability.dart';

class AbilityModel extends Ability {
  AbilityModel({required super.name, required super.isHidden});

  factory AbilityModel.fromJson(json) {
    return AbilityModel(
      name: json['name'] as String,
      isHidden: json['isHidden'] as bool,
    );
  }
}
