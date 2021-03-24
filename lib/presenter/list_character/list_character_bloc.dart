import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';

import 'list_character_event.dart';
import 'list_character_state.dart';

class ListCharacterBloc extends Bloc<ListCharacterEvent, ListCharacterState> {
  final SearchCharactersUseCase searchCharactersUseCase;

  ListCharacterBloc({@required this.searchCharactersUseCase}) : super(null);

  @override
  ListCharacterState get initialState => Loading();

  @override
  Stream<ListCharacterState> mapEventToState(
    ListCharacterEvent event,
  ) async* {
    if (event is Started) {
      try {
        final list = await searchCharactersUseCase.call();
        yield Loaded(
            list: list, page: 1, finish: list.length < 20, loading: false);
      } catch (e) {
        print(e);
      }
    }

    if (event is Fetch) {
      try {
        yield (state as Loaded).copyWith(loading: true);
        final newList = await searchCharactersUseCase.call(page: event.page);
        final oldList = (state as Loaded).list;
        oldList.addAll(newList);
        yield (state as Loaded).copyWith(
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
