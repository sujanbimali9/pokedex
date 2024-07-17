import 'package:pokedex/features/description/domain/entity/evolution.dart';

class EvolutionModel extends Evolution {
  EvolutionModel({
    required super.pokemon,
    required super.nextEvolution,
    required super.methods,
    required super.trigger,
    required super.pokemonId,
    required super.nextEvolutionId,
  });

  factory EvolutionModel.fromJson(json) {
    return EvolutionModel(
      pokemon: json['pokemon'] as String,
      nextEvolution: json['next_evolution'] as String,
      methods: List<String>.from((json['methods'])),
      trigger: json['trigger'] as String,
      pokemonId: json['pokemon_id'] as int,
      nextEvolutionId: json['next_evolution_id'] as int,
    );
  }
}
