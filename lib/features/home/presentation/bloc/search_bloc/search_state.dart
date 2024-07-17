part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  final List<Pokemon> pokemons;
  const SearchState(this.pokemons);
}

final class SearchInitial extends SearchState {
  const SearchInitial(super.pokemons);
}

final class SearchLoading extends SearchState {
  const SearchLoading(super.pokemons);
}

final class SearchLoaded extends SearchState {
  const SearchLoaded(super.pokemons);
}

final class SearchError extends SearchState {
  final String message;
  const SearchError(super.pokemons, this.message);
}
