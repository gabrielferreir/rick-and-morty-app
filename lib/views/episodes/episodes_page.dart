import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/repository/episodes_repository.dart';
import 'package:rickandmorty/views/episodes/episodes_content.dart';

import 'bloc.dart';

class EpisodesPage extends StatelessWidget {
  final int episode;
  final EpisodesRepository episodesRepository;

  EpisodesPage({@required this.episode, @required this.episodesRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EpisodesBloc>(
        builder: (context) =>
            EpisodesBloc(episodesRepository: episodesRepository)
              ..dispatch(Started(id: episode)),
        child: EpisodesContent());
  }
}
