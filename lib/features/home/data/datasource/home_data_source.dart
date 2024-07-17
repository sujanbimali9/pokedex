import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:pokedex/core/exception/exeption.dart';
import 'package:pokedex/features/home/data/model/pokemon_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeDataSource {
  Future<List<PokemonModel>> getPokemons(int limit, int offset);
  Future<List<PokemonModel>> searchPokemons(String query);
  Future<List<PokemonModel>> getPokemonByFilter(
      int limit, int offset, Map<String, Object> query);
}

class HomeDataSourceImplSupabase implements HomeDataSource {
  final SupabaseClient _supabase;

  HomeDataSourceImplSupabase(final SupabaseClient supabase)
      : _supabase = supabase;
  @override
  Future<List<PokemonModel>> getPokemons(int limit, int offset) async {
    try {
      if (offset >= 1025) {
        return [];
      }
      limit = limit.clamp(1, 1025 - offset);
      final response = await _supabase
          .from('pokemon')
          .select('id,name,types')
          .order('id', ascending: true)
          .range(offset, limit)
          .limit(limit);

      return response
          .map<PokemonModel>((e) => PokemonModel.fromJson(e))
          .toList();
    } on ClientException catch (e) {
      throw ServerException(e.message);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<PokemonModel>> searchPokemons(String query) async {
    try {
      // final response = await _supabase
      //     .from('pokemon')
      //     .select('id,name,types')
      //     .ilike('name', '%$query%')
      //     .limit(10);

      final response =
          await _supabase.rpc('fuzzy_search_pokemon', params: {'query': query});
      return response
          .map<PokemonModel>((e) => PokemonModel.fromJson(e))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<PokemonModel>> getPokemonByFilter(
      int limit, int offset, Map<String, Object> query) async {
    try {
      final response = await _supabase.rpc('fetch_pokemon_by_filter', params: {
        ...query,
        'limit_count': limit,
        'offset_value': offset,
      });

      log(response.toString());
      return response
          .map<PokemonModel>((e) => PokemonModel.fromJson(e))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
