import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/repository/character_repository.dart';
import 'package:rickandmorty/views/list_character/bloc.dart';
import 'package:rickandmorty/views/list_character/list_character_content.dart';

class ListCharacterPage extends StatelessWidget {
  final CharacterRepository characterRepository;

  ListCharacterPage({@required this.characterRepository});

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
          builder: (context) =>
              ListCharacterBloc(characterRepository: characterRepository)
                ..dispatch(Started()),
          child: ListCharacterContent(),
        ));
  }
}
