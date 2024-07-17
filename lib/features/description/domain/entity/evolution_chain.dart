import 'package:pokedex/features/description/domain/entity/evolution.dart';

class EvolutionChain {
  final List<Evolution> evolutions;
  final int id;

  EvolutionChain({required this.evolutions, required this.id});
}
