import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/features/home/domain/usecases/get_pokemon_by_filter.dart';
import 'package:pokedex/features/home/domain/usecases/get_pokemons.dart';
import 'package:pokedex/features/home/presentation/bloc/filter_cubit/filter_bloc_cubit.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPokemons _getPokemons;
  final GetPokemonByFilter _getPokemonByFilter;
  final FilterCubit _filterBloc;
  HomeBloc(GetPokemons getPokemons, GetPokemonByFilter getPokemonByFilter,
      FilterCubit filterBloc)
      : _getPokemons = getPokemons,
        _getPokemonByFilter = getPokemonByFilter,
        _filterBloc = filterBloc,
        super(const HomeState()) {
    on<FetchPokemons>(_fetchPokemon);
    on<FetchPokemonsByFilter>(_fetchPokemonByFilter);
  }
  void _fetchPokemonByFilter(
      FetchPokemonsByFilter event, Emitter<HomeState> emit) async {
    try {
      if (state.status.fetchingMore) {
        return;
      }
      if (event.isNew ?? false) {
        emit(state.copyWith(
            status: PokemonStatus.fetching,
            filteredPokemons: [],
            lastFilterPokemonId: 0,
            hasFilterReachMax: false));
      }

      if (state.lastFilterPokemonId >= 1025 || state.hasFilterReachMax) {
        if (!state.status.loaded) {
          emit(state.copyWith(lastFilterPokemonId: 1025));
        }
        return;
      }
      if (state.filteredPokemons.isEmpty) {
        emit(state.copyWith(status: PokemonStatus.loading));
      } else {
        emit(state.copyWith(status: PokemonStatus.fetching));
      }

      final limit =
          (event.limit ?? 20).clamp(1, 1025 - state.filteredPokemons.length);
      final offset = (event.offset ?? state.lastFilterPokemonId).clamp(0, 1025);
      final filterState = _filterBloc.state;
      print(filterState.selectedFilterGenerations);
      print(filterState.selectedFilterStatus);
      print(filterState.selectedFilterTypes);
      print(filterState.filterEnabled);
      final res = await _getPokemonByFilter(
        FilterPokemonParm(
          limit: limit,
          offset: offset,
          query: {
            'generations':
                List<String>.from(filterState.selectedFilterGenerations)
                  ..remove('All'),
            'pokemon_type': filterState.selectedFilterTypes
                .map((e) => e.toLowerCase())
                .toList(),
            'status': filterState.selectedFilterStatus,
          },
        ),
      );

      res.fold(
        (l) => emit(state.copyWith(
          error: l.message,
          status: PokemonStatus.error,
        )),
        (r) => emit(state.copyWith(
          filteredPokemons: [...state.filteredPokemons, ...r],
          status: PokemonStatus.loaded,
          hasFilterReachMax:
              r.isEmpty && r.length < (event.limit ?? 20) ? true : false,
          lastFilterPokemonId:
              r.isNotEmpty ? r.last.id : state.lastFilterPokemonId,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        status: PokemonStatus.error,
      ));
    }
  }

  void _fetchPokemon(FetchPokemons event, Emitter emit) async {
    if (_filterBloc.state.filterEnabled) {
      add(FetchPokemonsByFilter());
      return;
    }
    if (state.status.fetchingMore) {
      return;
    }

    if (state.pokemons.length >= 1025) {
      if (!state.status.loaded) {
        emit(state.copyWith(lastFilterPokemonId: 1025));
      }
      return;
    }
    if (state.pokemons.isEmpty) {
      emit(state.copyWith(status: PokemonStatus.loading));
    } else {
      emit(state.copyWith(status: PokemonStatus.fetching));
    }

    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
        () async {
          final limit =
              (event.limit ?? 20).clamp(1, 1025 - state.pokemons.length);
          final offset = (event.offset ?? state.pokemons.length).clamp(0, 1025);

          final res = await _getPokemons(
              FetchPokemonsParms(limit: limit, offset: offset));
          res.fold(
            (l) => emit(
                state.copyWith(error: l.message, status: PokemonStatus.error)),
            (r) => emit(state.copyWith(
                pokemons: [...state.pokemons, ...r],
                status: PokemonStatus.loaded)),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: PokemonStatus.error));
    }
  }
}
