import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/data/datasource/character_datasource_impl.dart';
import 'package:rickandmorty/data/mapper/character_mapper.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';

import 'data/repository/character_repository_impl.dart';
import 'presenter/list_character/list_character_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListCharacterPage(
        searchCharactersUseCase: SearchCharactersUseCaseImpl(
            characterRepository: CharacterRepositoryImpl(
                characterDatasource: CharacterDatasourceImpl(dio: Dio()),
                characterMapper: CharacterMapper())),
      ),
    );
  }
}