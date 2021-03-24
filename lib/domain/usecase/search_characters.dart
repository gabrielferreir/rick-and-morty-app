import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/repository/character_repository.dart';

mixin SearchCharactersUseCase {
  Future<List<Character>> call({int page = 0});
}

class SearchCharactersUseCaseImpl implements SearchCharactersUseCase {
  final CharacterRepository characterRepository;

  const SearchCharactersUseCaseImpl({
    this.characterRepository,
  }) : assert(characterRepository != null);

  @override
  Future<List<Character>> call({int page = 0}) async {
    return characterRepository.get(page: page);
  }
}
