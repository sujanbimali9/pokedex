part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class SearchPokemon extends SearchEvent {
  final String query;
  SearchPokemon(this.query);
}

final class _UpdatePokemon extends SearchEvent {
  final SearchState state;

  _UpdatePokemon(this.state);
}
