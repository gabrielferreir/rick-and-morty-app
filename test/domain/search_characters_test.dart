import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/domain/entities/character.dart';
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
      when(() => characterRepositoryMock.get(page: any(named: 'page')))
          .thenAnswer((_) async => [
                Character(
                    id: 123,
                    name: '',
                    episode: [],
                    status: '',
                    location: '',
                    origin: '',
                    species: '',
                    gender: '',
                    image: '')
              ]);
      await searchCharacters.call();
      verify(characterRepositoryMock.get).called(1);
    });
  });
}
