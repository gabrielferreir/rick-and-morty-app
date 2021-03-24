import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';

import 'list_character_bloc.dart';
import 'list_character_content.dart';
import 'list_character_event.dart';

class ListCharacterPage extends StatelessWidget {
  final SearchCharactersUseCase searchCharactersUseCase;

  ListCharacterPage({@required this.searchCharactersUseCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4d4669),
        appBar: AppBar(
            title: Text(
              'Rick and Morty App',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0),
        body: BlocProvider(
          create: (BuildContext context) => ListCharacterBloc(
              searchCharactersUseCase: searchCharactersUseCase)
            ..add(Started()),
          child: ListCharacterContent(),
        ));
  }
}
