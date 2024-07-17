import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/domain/usecases/search_pokemon.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchPokemonsInSupabase _searchPokemon;
  Timer? _debounceTimer;

  SearchBloc(final SearchPokemonsInSupabase searchPokemon)
      : _searchPokemon = searchPokemon,
        super(const SearchInitial([])) {
    on<SearchPokemon>(_onSearchPokemon);
    on<_UpdatePokemon>((event, emit) {
      emit(event.state);
    });
  }

  Future<void> _onSearchPokemon(
      SearchPokemon event, Emitter<SearchState> emit) async {
    _debounceTimer?.cancel();
    if (event.query.length < 3) {
      if (state.pokemons.isNotEmpty) {
        emit(const SearchLoaded([]));
      }
      return;
    }

    _debounceTimer = Timer(const Duration(seconds: 1), () async {
      add(_UpdatePokemon(SearchLoading(state.pokemons)));
      try {
        final pokemons = await _searchPokemon(event.query);
        pokemons.fold(
          (l) => add(_UpdatePokemon(SearchError(state.pokemons, l.message))),
          (r) => add(_UpdatePokemon(SearchLoaded(r))),
        );
      } catch (e) {
        add(_UpdatePokemon(SearchError(state.pokemons, e.toString())));
      }
    });
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
