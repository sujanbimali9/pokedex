import 'dart:async';

import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/description/data/model/pokemon_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class DescriptionDataSource {
  Future<PokemonDetailModel> getPokemonDetails(String id);
}

class DescriptionDataSourceImpSupabase implements DescriptionDataSource {
  final SupabaseClient _supabase;

  DescriptionDataSourceImpSupabase(SupabaseClient supabase)
      : _supabase = supabase;
  @override
  Future<PokemonDetailModel> getPokemonDetails(String id) async {
    try {
      final pokemon = await _supabase
          .from('pokemon')
          .select('*,pokemon_sprites(*,others(*))')
          .eq('id', id)
          .single();

      final evolution = pokemon['evolution_chain'] != null
          ? await _supabase
              .from('evolutions')
              .select('*')
              .eq('id', pokemon['evolution_chain'])
          : null;

      return PokemonDetailModel.fromJson({
        ...pokemon,
        'evolution_chain': {...?evolution}
      });
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
