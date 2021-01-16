// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../list_character/domain/mappers/character_mapper.dart';
import '../list_character/domain/repositories/character_repository.dart';
import '../list_character/data/repositories/character_repository_impl.dart';
import '../list_character/data/datasource/list_character_data_source.dart';
import '../list_character/remote/list_character_data_source_impl.dart';
import '../list_character/domain/usecases/character_search.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<CharacterMapper>(() => CharacterMapper());
  gh.lazySingleton<ListCharacterDataSource>(
      () => ListCharacterDataSourceImpl(dio: get<Dio>()));
  gh.lazySingleton<CharacterRepository>(() => DisponibilidadeRepositoryImpl(
      listCharacterDataSource: get<ListCharacterDataSource>(),
      characterMapper: get<CharacterMapper>()));
  gh.lazySingleton<Search>(
      () => SearchImpl(characterRepository: get<CharacterRepository>()));
  return get;
}
