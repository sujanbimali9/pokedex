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

  factory EvolutionModel.fromJson(Map<String, dynamic> json, int index) {
    String pokemon = json['species']['name'];
    String nextEvolution = json['evolves_to'][index]['species']['name'];
    List<String> methods = [];
    final evolutionDetails = json['evolves_to'][index]['evolution_details'][0];
    String pokemonId =
        (json['species']['url'] as String).split('/').reversed.elementAt(1);
    String triggerUrl =
        json['evolves_to'][index]['evolution_details'][0]['trigger']['name'];
    String nextEvolutionId =
        (json['evolves_to'][index]['species']['url'] as String)
            .split('/')
            .reversed
            .elementAt(1);
    for (var field in methodFields) {
      if (evolutionDetails[field] != null &&
          evolutionDetails[field].toString().isNotEmpty) {
        String label = customLabels[field] ?? field;
        methods.add('$label: ${evolutionDetails[field]}');
      }
    }

    for (var field in methodFieldsNamed) {
      if (evolutionDetails[field] != null &&
          evolutionDetails[field]['name'].toString().isNotEmpty) {
        String label = customLabels[field] ?? field;
        methods.add('$label: ${evolutionDetails[field]['name']}');
      }
    }

    return EvolutionModel(
      pokemon: pokemon,
      nextEvolution: nextEvolution,
      methods: methods.join('\n'),
      trigger: triggerUrl,
      pokemonId: pokemonId,
      nextEvolutionId: nextEvolutionId,
    );
  }
}

class EvolutionChainModel extends EvolutionChain {
  EvolutionChainModel({required super.evolutions});
  factory EvolutionChainModel.fromJson(
      Map<String, dynamic> json, String pokemonName) {
    List<Evolution> evolutions = [];

    var chain = json['chain'];
    void parseEvolutions(Map<String, dynamic> evolutionData) {
      if (evolutionData['evolves_to'].isNotEmpty) {
        for (int i = 0; i < evolutionData['evolves_to'].length; i++) {
          evolutions.add(EvolutionModel.fromJson(evolutionData, i));
          if (evolutionData['evolves_to'][i]['evolves_to'].isNotEmpty) {
            parseEvolutions(evolutionData['evolves_to'][i]);
          }
        }
      }
    }

    parseEvolutions(chain);

    return EvolutionChainModel(evolutions: evolutions);
  }
}

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
  'trade_species',
];

Map<String, String> customLabels = {
  'gender': 'Gender',
  'min_level': 'Lvl',
  'min_happiness': 'Happiness',
  'min_beauty': 'Beauty',
  'min_affection': 'Affection',
  'relative_physical_stats': 'Physical Stats',
  'time_of_day': 'Time of Day',
  'item': 'Item',
  'held_item': 'Held Item',
  'known_move': 'Known Move',
  'known_move_type': 'Known Move Type',
  'location': 'Location',
  'party_species': 'Party Species',
  'party_type': 'Party Type',
  'trade_species': 'Trade Species',
};
