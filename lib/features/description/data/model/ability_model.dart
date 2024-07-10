import 'package:pokedex/core/utils/functions/captalize_first_letter.dart';
import 'package:pokedex/features/description/domain/entity/ability.dart';

class AbilityModel extends Ability {
  AbilityModel({
    required super.name,
    required super.isHidden,
    required super.slot,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      name: capitalize(json['ability']['name']),
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }
}
