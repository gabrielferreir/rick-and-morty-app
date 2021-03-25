import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/domain/usecase/search_episode.dart';

import 'episodes_bloc.dart';
import 'episodes_content.dart';
import 'episodes_event.dart';

class EpisodesPage extends StatelessWidget {
  final int episode;
  final SearchEpisodeUseCase searchEpisodeUseCase;

  EpisodesPage({@required this.episode, @required this.searchEpisodeUseCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EpisodesBloc>(
      create: (context) =>
          EpisodesBloc(searchEpisodeUseCase: searchEpisodeUseCase)
            ..add(Started(id: episode)),
      child: EpisodesContent(),
    );
  }
}
