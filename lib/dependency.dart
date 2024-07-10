import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/features/description/data/repository/detail_repository_imp.dart';
import 'package:pokedex/features/description/data/source/remote_data_source.dart';
import 'package:pokedex/features/description/domain/repository/detail_repository.dart';
import 'package:pokedex/features/description/domain/usecases/get_pokemon_detail.dart';
import 'package:pokedex/features/description/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex/features/home/data/datasource/home_data_source.dart';
import 'package:pokedex/features/home/data/repository/home_repository_imp.dart';
import 'package:pokedex/features/home/domain/repository/home_repository.dart';
import 'package:pokedex/features/home/domain/usecases/get_pokemons.dart';
import 'package:pokedex/features/home/presentation/bloc/home_bloc.dart';

final serviceLocater = GetIt.instance;

void initDependency() {
  serviceLocater
        ..registerLazySingleton(() => Dio())
        ..registerFactory<HomeDataSource>(
            () => HomeDataSourceImpl(dio: serviceLocater()))
        ..registerFactory<HomeRepository>(
            () => HomeRepositoryImp(dataSource: serviceLocater()))
        ..registerFactory(() => GetPokemons(repository: serviceLocater()))
        ..registerFactory(() => HomeBloc(serviceLocater()))
        ..registerFactory<DescriptionDataSource>(
            () => DescriptionDataSourceImp(dio: serviceLocater()))
        ..registerFactory<DetailRepository>(
            () => DetailRepositoryImp(dataSource: serviceLocater()))
        ..registerFactory(() => GetPokemonDetail(repository: serviceLocater()))
        ..registerFactory(() => PokemonDetailBloc(serviceLocater()))

      //registerLazySingleton(() => GetPokemonDetail())..
      //registerLazySingleton(() => GetPokemonTypes())..
      //registerLazySingleton(() => GetPokemonSpecies())..
      //registerLazySingleton(() => GetPokemonEvolutionChain())..
      //registerLazySingleton(() => GetPokemonHabitat())..
      //registerLazySingleton(() => GetPokemonColor())..
      //registerLazySingleton(() => GetPokemonShape())..
      //registerLazySingleton(() => GetPokemonAbility())..
      //registerLazySingleton(() => GetPokemonStat())..
      //registerLazySingleton(() => GetPokemonMove())..
      //registerLazySingleton(() => GetPokemonGender())
      ;
}
