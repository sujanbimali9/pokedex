part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(
    List<Pokemon> pokemons,
    int lastPokemonId,
  ) = _Initial;
  const factory HomeState.loading(
    List<Pokemon> pokemons,
    int lastPokemonId,
  ) = _Loading;
  const factory HomeState.loaded(
    List<Pokemon> pokemons,
    int lastPokemonId,
  ) = _Loaded;
  const factory HomeState.error(
    List<Pokemon> pokemons,
    int lastPokemonId,
    String message,
  ) = _Error;
  const factory HomeState.fetchingMore(
    List<Pokemon> pokemons,
    int lastPokemonId,
  ) = _FetchingMore;
}
