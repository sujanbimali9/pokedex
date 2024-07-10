import 'dart:developer';

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

  factory EvolutionModel.fromJson(Map<String, dynamic> json) {
    String pokemonName = json['species']['name'];
    String pokemonId = (json['species']['url'] as String)
        .split('/')
        .reversed
        .elementAt(1)
        .toString();
    String nextEvolution = '';
    String nextEvolutionId = '';

    List<String> methods = [];
    String trigger = '';

    if ((json['evolves_to'] as List).isNotEmpty) {
      var nextEvolutionJson = json['evolves_to'].first;
      nextEvolution = nextEvolutionJson['species']['name'];
      nextEvolutionId = (nextEvolutionJson['species']['url'] as String)
          .split('/')
          .reversed
          .elementAt(1)
          .toString();
      if (nextEvolutionJson['evolution_details'].isNotEmpty) {
        var evolutionDetails = nextEvolutionJson['evolution_details'].first;

        List<String> methodFields = [
          'gender',
          'min_level',
          'min_happiness',
          'min_beauty',
          'min_affection',
          'relative_physical_stats',
          'time_of_day',
        ];
        List<String> methodFieldsNamed = [
          'item',
          'held_item',
          'known_move',
          'known_move_type',
          'location',
          'party_species',
          'party_type',
          'trade_species'
        ];

        for (var field in methodFields) {
          if (evolutionDetails[field] != null) {
            if (field != 'min_level') {
              methods.add(evolutionDetails[field].toString());
            } else {
              methods.add('Lvl ${evolutionDetails[field]}');
            }
          }
        }
        for (var field in methodFieldsNamed) {
          if (evolutionDetails[field] != null) {
            methods.add(evolutionDetails[field]['name'].toString());
            methods.add('Lvl ${evolutionDetails[field]}');
          }
        }
        trigger = evolutionDetails['trigger']['name'] ?? '';
      }
    }

    return EvolutionModel(
      pokemon: pokemonName,
      nextEvolution: nextEvolution,
      methods: methods.join(', '),
      trigger: trigger,
      pokemonId: pokemonId,
      nextEvolutionId: nextEvolutionId,
    );
  }
}

class EvolutionChainModel extends EvolutionChain {
  EvolutionChainModel({required super.evolutions});

  factory EvolutionChainModel.fromJson(Map<String, dynamic> json) {
    List<Evolution> evolutions = [];
    log(json.toString());

    void addEvolutions(Map<String, dynamic> chainJson) {
      if (chainJson['evolves_to'].isNotEmpty) {
        var evolutionDetail = EvolutionModel.fromJson(chainJson);
        evolutions.add(evolutionDetail);
        for (var nextEvolution in chainJson['evolves_to']) {
          addEvolutions(nextEvolution);
        }
      }
    }

    addEvolutions(json['chain']);
    return EvolutionChainModel(evolutions: evolutions);
  }
}
