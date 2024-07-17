part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailEvent {
  const PokemonDetailEvent();
}

class GetDetails extends PokemonDetailEvent {
  const GetDetails(this.pokemon);
  final Pokemon pokemon;
}
