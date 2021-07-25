import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../domain/usecase/search_characters.dart';

import 'list_character_state.dart';

class ListCharacterCubit extends Cubit<ListCharacterState> {
  final SearchCharactersUseCase searchCharactersUseCase;

  ListCharacterCubit({required this.searchCharactersUseCase})
      : super(ListCharacterState(isLoading: true));

  void started() async {
    try {
      emit(ListCharacterState(isLoading: true));
      final list = await searchCharactersUseCase.call();
      emit(ListCharacterState(
          list: list, page: 1, finish: list.length < 20, loading: false));
    } on DioError catch (e) {
      emit(ListCharacterState(message: e.response!.data));
    } on Exception {
      emit(ListCharacterState(message: 'Internal server error'));
    }
  }

  void fetch({required int page}) async {
    try {
      emit(state.copyWith(loading: true));
      final newList = await searchCharactersUseCase.call(page: page);
      emit(state.copyWith(list: [
        ...state.list,
        ...newList,
      ], page: page, finish: newList.length < 20, loading: false));
    } on DioError catch (e) {
      emit(ListCharacterState(message: e.response!.data));
    } on Exception {
      emit(ListCharacterState(message: 'Internal server error'));
    }
  }
}
