import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/repository/character_repository.dart';
import 'package:rickandmorty/views/list_character/list_character_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListCharacterPage(
        characterRepository: CharacterRepository(dio: Dio()),
      ),
    );
  }
}
