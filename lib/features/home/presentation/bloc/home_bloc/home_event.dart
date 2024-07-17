part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchPokemons extends HomeEvent {
  final int? offset;
  final int? limit;

  FetchPokemons({this.offset, this.limit});
}

class FetchPokemonsByFilter extends HomeEvent {
  final int? offset;
  final int? limit;
  final bool? isNew;
  FetchPokemonsByFilter({this.offset, this.limit, this.isNew});
}
