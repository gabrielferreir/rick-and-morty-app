import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/character_datasource_impl.dart';
import 'data/datasource/episodes_datasource_impl.dart';
import 'data/mapper/character_mapper.dart';
import 'data/mapper/episodes_mapper.dart';
import 'data/repository/character_repository_impl.dart';
import 'data/repository/episodes_repository_impl.dart';
import 'domain/usecase/search_characters.dart';
import 'domain/usecase/search_episode.dart';
import 'presenter/episodes/episodes_bloc.dart';
import 'presenter/list_character/list_character_bloc.dart';
import 'util/constraints.dart';

Future<void> configure() async {
  GetIt.I.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: kUrl)));

  GetIt.I.registerSingleton<BaseCacheManager>(DefaultCacheManager());

  GetIt.I.registerFactory<ListCharacterCubit>(() => ListCharacterCubit(
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
