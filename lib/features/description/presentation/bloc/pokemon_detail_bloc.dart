import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/features/description/domain/entity/pokemon_detail.dart';
import 'package:pokedex/features/description/domain/usecases/get_pokemon_detail.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';
part 'pokemon_detail_bloc.freezed.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final GetPokemonDetail _getPokemonDetail;
  PokemonDetailBloc(final GetPokemonDetail getPokemonDetail)
      : _getPokemonDetail = getPokemonDetail,
        super(const _Initial()) {
    on<PokemonDetailEvent>((event, emit) async {
      await event.map(getPokemonDetails: (event) async {
        if (state.maybeWhen(
            orElse: () => false,
            loaded: (pokemon) => pokemon.id == event.pokemon.id)) return;
        emit(const _Initial());
        emit(const _Loading());

        try {
          final details = await _getPokemonDetail(event.pokemon);
          details.fold(
            (l) => emit(_Error(l.message)),
            (r) => emit(_Loaded(r)),
          );
        } catch (e) {
          log('Error: $e');
          emit(_Error(e.toString()));
        }
      });
    });
  }
}
