import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/data/datasource/character_datasource_impl.dart';
import 'package:rickandmorty/data/mapper/character_mapper.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';
import 'package:rickandmorty/util/constraints.dart';

import 'data/repository/character_repository_impl.dart';
import 'presenter/list_character/list_character_page.dart';

void main() {
  final dio = Dio(BaseOptions(baseUrl: kUrl));
  runApp(MyApp(
      searchCharactersUseCase: SearchCharactersUseCaseImpl(
    characterRepository: CharacterRepositoryImpl(
      characterDatasource: CharacterDatasourceImpl(dio: dio),
      characterMapper: CharacterMapper(),
    ),
  )));
}

class MyApp extends StatelessWidget {
  final SearchCharactersUseCase searchCharactersUseCase;

  MyApp({@required this.searchCharactersUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListCharacterPage(
      searchCharactersUseCase: searchCharactersUseCase,
    ));
  }
}
