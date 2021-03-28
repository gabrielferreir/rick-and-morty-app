import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';

import 'list_character_event.dart';
import 'list_character_state.dart';

class ListCharacterBloc extends Bloc<ListCharacterEvent, ListCharacterState> {
  final SearchCharactersUseCase searchCharactersUseCase;

  ListCharacterBloc({@required this.searchCharactersUseCase})
      : super(Loading());

  @override
  Stream<ListCharacterState> mapEventToState(
    ListCharacterEvent event,
  ) async* {
    if (event is Started) {
      try {
        final list = await searchCharactersUseCase.call();
        yield Loaded(
            list: list, page: 1, finish: list.length < 20, loading: false);
      } on DioError catch (e) {
        yield WithError(message: e.response.data);
      } catch (e) {
        yield WithError(message: 'Internal server error');
      }
    }

    if (event is Fetch) {
      try {
        yield (state as Loaded).copyWith(loading: true);
        final newList = await searchCharactersUseCase.call(page: event.page);
        final oldList = (state as Loaded).list;
        yield (state as Loaded).copyWith(list: [
          ...oldList,
          ...newList,
        ], page: event.page, finish: newList.length < 20, loading: false);
      } on DioError catch (e) {
        yield WithError(message: e.response.data);
      } catch (e) {
        yield WithError(message: 'Internal server error');
      }
    }
  }
}
