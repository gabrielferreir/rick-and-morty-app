import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'list_character_bloc.dart';
import 'list_character_content.dart';
import 'list_character_event.dart';

class ListCharacterPage extends StatelessWidget {
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
          create: (context) => GetIt.I.get<ListCharacterBloc>()..add(Started()),
          child: ListCharacterContent(),
        ));
  }
}
