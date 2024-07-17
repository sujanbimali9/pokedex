class Evolution {
  final String pokemon;
  final String nextEvolution;
  final List<String> methods;
  final String trigger;
  final int pokemonId;
  final int nextEvolutionId;

  Evolution({
    required this.pokemon,
    required this.nextEvolution,
    required this.methods,
    required this.trigger,
    required this.pokemonId,
    required this.nextEvolutionId,
  });
}
