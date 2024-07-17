import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/description/domain/entity/pokemon.dart';
import 'package:pokedex/features/description/domain/usecases/get_pokemon_detail.dart';
import 'package:pokedex/features/home/domain/entity/pokemon_entity.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final GetPokemonDetail _getPokemonDetail;
  PokemonDetailBloc(final GetPokemonDetail getPokemonDetail)
      : _getPokemonDetail = getPokemonDetail,
        super(const PokemonDetailStateInitial()) {
    on<GetDetails>((event, emit) async {
      if (state is PokemonDetailStateLoaded &&
          (state as PokemonDetailStateLoaded).pokemon.id == event.pokemon.id) {
        return;
      }
      emit(const PokemonDetailStateLoading());

      try {
        final details = await _getPokemonDetail(event.pokemon);
        details.fold(
          (l) => emit(PokemonDetailStateError(l.message)),
          (r) => emit(PokemonDetailStateLoaded(r)),
        );
      } catch (e) {
        log('Error: $e');
        emit(PokemonDetailStateError(e.toString()));
      }
    });
  }
}
