import 'package:injectable/injectable.dart';
import 'package:rickandmorty/modules/list_character/data/models/character_model.dart';
import 'package:rickandmorty/modules/list_character/domain/entities/character.dart';
import 'package:rickandmorty/modules/shared/mapper_domain.dart';

@lazySingleton
class CharacterMapper extends MapperDomain<Character, CharacterModel> {
  @override
  Character handle(CharacterModel airPortModel) {
    return Character(

    );
  }
}
