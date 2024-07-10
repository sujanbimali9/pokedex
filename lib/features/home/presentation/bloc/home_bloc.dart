import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';
import 'package:pokedex/features/home/domain/usecases/get_pokemons.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPokemons _getPokemons;
  HomeBloc(GetPokemons getPokemons)
      : _getPokemons = getPokemons,
        super(const _Initial([], 0)) {
    on<HomeEvent>((event, emit) async {
      await event.map(fetchPokemons: (_) async {
        if (state is _FetchingMore) return;
        if (state.pokemons.isEmpty) {
          emit(const _Loading([], 0));
        } else {
          emit(_FetchingMore(state.pokemons, state.lastPokemonId));
        }
        await Future.delayed(const Duration(seconds: 2), () async {
          final res = await _getPokemons(FetchPokemonsParms(
              limit: event.limit ?? 20,
              offset: event.offset ?? state.lastPokemonId));
          res.fold(
            (l) => emit(_Error(state.pokemons, state.lastPokemonId, l.message)),
            (r) => emit(
              _Loaded(
                [...state.pokemons, ...r],
                r.last.id,
              ),
            ),
          );
        });
      });
    });
  }
}
