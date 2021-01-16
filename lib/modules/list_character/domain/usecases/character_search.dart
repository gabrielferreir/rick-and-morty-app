import 'package:injectable/injectable.dart';

import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';

mixin Search {
  Future<List<Character>> call();
}

@LazySingleton(as: Search)
class SearchImpl implements Search {
  const SearchImpl({
    this.characterRepository,
  }) : assert(characterRepository != null);

  final CharacterRepository characterRepository;

  @override
  Future<List<Character>> call() async {
    return characterRepository.search();
  }
}
