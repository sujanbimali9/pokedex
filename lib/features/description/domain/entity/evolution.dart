class Evolution {
  final String pokemon;
  final String nextEvolution;
  final String methods;
  final String trigger;
  final String pokemonId;
  final String nextEvolutionId;

  Evolution({
    required this.pokemon,
    required this.nextEvolution,
    required this.methods,
    required this.trigger,
    required this.pokemonId,
    required this.nextEvolutionId,
  });
}

class EvolutionChain {
  final List<Evolution> evolutions;

  EvolutionChain({
    required this.evolutions,
  });
}
