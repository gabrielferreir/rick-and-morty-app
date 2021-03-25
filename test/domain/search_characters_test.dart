import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rickandmorty/domain/repository/character_repository.dart';
import 'package:rickandmorty/domain/usecase/search_characters.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

void main() {
  final characterRepositoryMock = CharacterRepositoryMock();
  final searchCharacters = SearchCharactersUseCaseImpl(
    characterRepository: characterRepositoryMock,
  );
  group('CharacterRepository', () {
    test('Should be return a list of characters', () async {
      await searchCharacters.call();
      verify(characterRepositoryMock.get()).called(1);
    });
  });
}
