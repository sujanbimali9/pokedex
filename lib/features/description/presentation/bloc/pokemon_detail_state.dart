part of 'pokemon_detail_bloc.dart';

@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState.initial() = _Initial;
  const factory PokemonDetailState.loading() = _Loading;
  const factory PokemonDetailState.loaded(PokemonDetail pokemon) = _Loaded;
  const factory PokemonDetailState.error(String message) = _Error;
}
