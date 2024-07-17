import 'package:pokedex/features/description/data/model/evolution_model.dart';
import 'package:pokedex/features/description/domain/entity/evolution_chain.dart';

class EvolutionChainModel extends EvolutionChain {
  EvolutionChainModel({
    required List<EvolutionModel> super.evolutions,
    required super.id,
  });

  factory EvolutionChainModel.fromJson(json) {
    return EvolutionChainModel(
      id: json.first['id'],
      evolutions:
          json.map<EvolutionModel>((e) => EvolutionModel.fromJson(e)).toList(),
    );
  }
}
