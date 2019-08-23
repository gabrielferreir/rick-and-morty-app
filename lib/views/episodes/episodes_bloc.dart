import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/repository/episodes_repository.dart';
import './bloc.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodesRepository episodesRepository;

  EpisodesBloc({@required this.episodesRepository});

  @override
  EpisodesState get initialState => Loading();

  @override
  Stream<EpisodesState> mapEventToState(
    EpisodesEvent event,
  ) async* {
    if (event is Started) {
      try {
        final res = await this.episodesRepository.get(id: event.id);
        yield Loaded(episodesModel: res);
      } catch (e) {
        print(e);
      }
    }
  }
}
