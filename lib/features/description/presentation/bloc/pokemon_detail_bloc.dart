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
        emit(const _Loading());
        final details = await _getPokemonDetail(event.pokemon);
        details.fold(
          (l) => emit(_Error(l.message)),
          (r) => emit(_Loaded(r)),
        );
      });
    });
  }
}
