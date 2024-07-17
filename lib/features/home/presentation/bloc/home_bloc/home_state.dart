part of 'home_bloc.dart';

enum PokemonStatus { initial, loading, fetching, loaded, error }

extension PokemonStatusX on PokemonStatus {
  bool get initial => this == PokemonStatus.initial;
  bool get loading => this == PokemonStatus.loading;
  bool get fetchingMore => this == PokemonStatus.fetching;
  bool get loaded => this == PokemonStatus.loaded;
  bool get error => this == PokemonStatus.error;
}

final class HomeState extends Equatable {
  final List<Pokemon> pokemons;
  final List<Pokemon> filteredPokemons;
  final int lastFilterPokemonId;
  final bool hasFilterReachMax;
  final PokemonStatus status;
  final String? error;

  const HomeState({
    this.pokemons = const <Pokemon>[],
    this.filteredPokemons = const <Pokemon>[],
    this.lastFilterPokemonId = 0,
    this.hasFilterReachMax = false,
    this.status = PokemonStatus.initial,
    this.error,
  });

  HomeState copyWith({
    List<Pokemon>? pokemons,
    List<Pokemon>? filteredPokemons,
    int? lastFilterPokemonId,
    bool? hasFilterReachMax,
    String? error,
    PokemonStatus? status,
  }) {
    return HomeState(
      pokemons: pokemons ?? this.pokemons,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
      lastFilterPokemonId: lastFilterPokemonId ?? this.lastFilterPokemonId,
      hasFilterReachMax: hasFilterReachMax ?? this.hasFilterReachMax,
      error: error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        pokemons,
        lastFilterPokemonId,
        hasFilterReachMax,
        filteredPokemons,
        status
      ];
}
