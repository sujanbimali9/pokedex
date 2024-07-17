part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailState {
  const PokemonDetailState();
}

class PokemonDetailStateInitial extends PokemonDetailState {
  const PokemonDetailStateInitial();
}

class PokemonDetailStateLoading extends PokemonDetailState {
  const PokemonDetailStateLoading();
}

class PokemonDetailStateLoaded extends PokemonDetailState {
  const PokemonDetailStateLoaded(this.pokemon);
  final PokemonDetail pokemon;
}

class PokemonDetailStateError extends PokemonDetailState {
  const PokemonDetailStateError(this.message);
  final String message;
}
