import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/data/datasource/character_datasource_impl.dart';
import 'package:rickandmorty/data/datasource/episodes_datasource_impl.dart';
import 'package:rickandmorty/data/mapper/character_mapper.dart';
import 'package:rickandmorty/data/mapper/episodes_mapper.dart';
import 'package:rickandmorty/data/repository/character_repository_impl.dart';
import 'package:rickandmorty/data/repository/episodes_repository_impl.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';
import 'package:rickandmorty/domain/usecase/search_episode.dart';
import 'package:rickandmorty/presenter/episodes/episodes_bloc.dart';
import 'package:rickandmorty/presenter/list_character/list_character_bloc.dart';
import 'package:rickandmorty/util/constraints.dart';

Future<void> configure() async {
  GetIt.I.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: kUrl)));

  GetIt.I.registerSingleton<BaseCacheManager>(DefaultCacheManager());

  GetIt.I.registerFactory<ListCharacterBloc>(() => ListCharacterBloc(
      searchCharactersUseCase: SearchCharactersUseCaseImpl(
          characterRepository: CharacterRepositoryImpl(
              characterMapper: CharacterMapper(),
              characterDatasource:
                  CharacterDatasourceImpl(dio: GetIt.I.get<Dio>())))));

  GetIt.I.registerFactory<EpisodesBloc>(() => EpisodesBloc(
      searchEpisodeUseCase: SearchEpisodeUseCaseImpl(
          episodesRepository: EpisodesRepositoryImpl(
              episodesMapper:
                  EpisodesMapper(characterMapper: CharacterMapper()),
              episodesDatasource:
                  EpisodesDatasourceImpl(dio: GetIt.I.get<Dio>())))));
}
