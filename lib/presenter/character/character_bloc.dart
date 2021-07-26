import 'package:bloc/bloc.dart';

import '../../domain/usecase/character_is_favorite.dart';
import '../../domain/usecase/character_save_favorite.dart';
import 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterIsFavoriteUseCase characterIsFavoriteUseCase;
  final CharacterSaveFavoriteUseCase characterSaveFavoriteUseCase;

  CharacterCubit({
    required this.characterIsFavoriteUseCase,
    required this.characterSaveFavoriteUseCase,
  }) : super(CharacterState(isLoading: true));

  void isFavorite({
    required int id,
  }) async {
    try {
      emit(CharacterState(isLoading: true));
      final isFavorite = await characterIsFavoriteUseCase.call(id: id);
      emit(CharacterState(isFavorite: isFavorite));
    } on Exception {
      emit(CharacterState(message: 'Internal server error'));
    }
  }

  void save({
    required int id,
  }) async {
    try {
      final isFavorite = await characterSaveFavoriteUseCase.call(id: id);
      emit(CharacterState(isFavorite: isFavorite, message: 'Success'));
    } on Exception {
      emit(CharacterState(message: 'Internal server error'));
    }
  }
}
