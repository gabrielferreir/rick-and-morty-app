import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/repository/character_repository.dart';
import './bloc.dart';

class ListCharacterBloc extends Bloc<ListCharacterEvent, ListCharacterState> {
  final CharacterRepository characterRepository;

  ListCharacterBloc({@required this.characterRepository});

  @override
  ListCharacterState get initialState => Loading();

  @override
  Stream<ListCharacterState> mapEventToState(
    ListCharacterEvent event,
  ) async* {
    if (event is Started) {
      try {
        final list = await characterRepository.get();
        yield Loaded(
            list: list, page: 1, finish: list.length < 20, loading: false);
      } catch (e) {
        print(e);
      }
    }

    if (event is Fetch) {
      try {
        yield (currentState as Loaded).copyWith(loading: true);
        final newList = await characterRepository.get(page: event.page);
        final oldList = (currentState as Loaded).list;
        oldList.addAll(newList);
        yield (currentState as Loaded).copyWith(
            list: List.from(oldList),
            page: event.page,
            finish: List.from(oldList).length < 20,
            loading: false);
      } catch (e) {
        print(e);
      }
    }
  }
}
