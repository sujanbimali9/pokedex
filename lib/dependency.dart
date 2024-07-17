import 'package:get_it/get_it.dart';
import 'package:pokedex/features/description/data/repository/detail_repository_imp.dart';
import 'package:pokedex/features/description/data/source/remote_data_source.dart';
import 'package:pokedex/features/description/domain/repository/detail_repository.dart';
import 'package:pokedex/features/description/domain/usecases/get_pokemon_detail.dart';
import 'package:pokedex/features/description/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex/features/home/data/datasource/home_data_source.dart';
import 'package:pokedex/features/home/data/repository/home_repository_imp.dart';
import 'package:pokedex/features/home/domain/repository/home_repository.dart';
import 'package:pokedex/features/home/domain/usecases/get_pokemon_by_filter.dart';
import 'package:pokedex/features/home/domain/usecases/get_pokemons.dart';
import 'package:pokedex/features/home/domain/usecases/search_pokemon.dart';
import 'package:pokedex/features/home/presentation/bloc/filter_cubit/filter_bloc_cubit.dart';
import 'package:pokedex/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocater = GetIt.instance;

void initDependency() {
  serviceLocater
        ..registerLazySingleton(() => Supabase.instance.client)
        ..registerFactory<HomeDataSource>(
            () => HomeDataSourceImplSupabase(serviceLocater()))
        ..registerFactory<HomeRepository>(
            () => HomeRepositoryImp(dataSource: serviceLocater()))
        ..registerFactory(() => GetPokemons(repository: serviceLocater()))
        ..registerFactory(
            () => GetPokemonByFilter(repository: serviceLocater()))
        ..registerFactory<DescriptionDataSource>(
            () => DescriptionDataSourceImpSupabase(serviceLocater()))
        ..registerFactory<DetailRepository>(
            () => DetailRepositoryImp(dataSource: serviceLocater()))
        ..registerFactory(() => GetPokemonDetail(repository: serviceLocater()))
        ..registerFactory(() => SearchPokemonsInSupabase(serviceLocater()))
        ..registerFactory(() => FilterCubit())
        ..registerFactory(() => PokemonDetailBloc(serviceLocater()))
        ..registerFactory(() => SearchBloc(serviceLocater()))
      //
      //
      ;
}
