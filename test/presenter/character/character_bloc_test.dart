import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/usecase/character_is_favorite.dart';
import 'package:rickandmorty/domain/usecase/character_save_favorite.dart';
import 'package:rickandmorty/presenter/character/character_bloc.dart';
import 'package:rickandmorty/presenter/character/character_state.dart';
import 'package:test/test.dart';

class CharacterIsFavoriteUseCaseMock extends Mock
    implements CharacterIsFavoriteUseCase {}

class CharacterSaveFavoriteUseCaseMock extends Mock
    implements CharacterSaveFavoriteUseCase {}

void main() {
  group('CharacterBloc', () {
    late CharacterCubit characterCubit;
    late CharacterIsFavoriteUseCase characterIsFavoriteUseCaseMock;
    late CharacterSaveFavoriteUseCase characterSaveFavoriteUseCaseMock;

    setUp(() {
      characterIsFavoriteUseCaseMock = CharacterIsFavoriteUseCaseMock();
      characterSaveFavoriteUseCaseMock = CharacterSaveFavoriteUseCaseMock();
      characterCubit = CharacterCubit(
          characterIsFavoriteUseCase: characterIsFavoriteUseCaseMock,
          characterSaveFavoriteUseCase: characterSaveFavoriteUseCaseMock);
    });

    test('Initial state is loading', () {
      expect(characterCubit.state.toString(),
          CharacterState(isLoading: true).toString());
    });

    blocTest('Should be a favorite',
        build: () {
          when(() => characterIsFavoriteUseCaseMock.call(id: 1))
              .thenAnswer((_) async => true);
          return characterCubit;
        },
        act: (bloc) async => (bloc as CharacterCubit)..isFavorite(id: 1),
        expect: () => [
              CharacterState(isLoading: true),
              CharacterState(isFavorite: true)
            ]);

    blocTest('Should show an error message when searching if it is favorite',
        build: () {
          when(() => characterIsFavoriteUseCaseMock.call(id: 1))
              .thenThrow(Exception('Error'));
          return characterCubit;
        },
        act: (bloc) async => (bloc as CharacterCubit)..isFavorite(id: 1),
        expect: () => [
              CharacterState(isLoading: true),
              CharacterState(message: 'Internal server error')
            ]);

    blocTest('Should show success message when saving as favorite',
        build: () {
          when(() => characterSaveFavoriteUseCaseMock.call(id: 1))
              .thenAnswer((_) async => true);
          characterCubit.emit(CharacterState(isFavorite: false));
          return characterCubit;
        },
        act: (bloc) async => (bloc as CharacterCubit)..save(id: 1),
        expect: () => [CharacterState(isFavorite: true, message: 'Success')]);

    blocTest('Should show error message when saving as favorite',
        build: () {
          when(() => characterSaveFavoriteUseCaseMock.call(id: 1))
              .thenThrow(Exception(''));
          characterCubit.emit(CharacterState(isFavorite: false));
          return characterCubit;
        },
        act: (bloc) async => (bloc as CharacterCubit)..save(id: 1),
        expect: () => [CharacterState(message: 'Internal server error')]);
  });
}
