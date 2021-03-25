import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/domain/usecase/search_episode.dart';

import 'episodes_event.dart';
import 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final SearchEpisodeUseCase searchEpisodeUseCase;

  EpisodesBloc({@required this.searchEpisodeUseCase}) : super(Loading());

  @override
  Stream<EpisodesState> mapEventToState(
    EpisodesEvent event,
  ) async* {
    if (event is Started) {
      try {
        final episodes = await this.searchEpisodeUseCase.call(id: event.id);
        yield Loaded(episodes: episodes);
      } catch (e) {
        print(e);
      }
    }
  }
}
