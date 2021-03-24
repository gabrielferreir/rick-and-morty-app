import 'package:rickandmorty/data/model/character_model.dart';
import 'package:rickandmorty/domain/entities/character.dart';

class CharacterMapper {
  Character handle(CharacterModel characterModel) => Character(
        id: characterModel.id,
        name: characterModel.name,
        gender: characterModel.gender,
        origin: characterModel.origin,
        episode: characterModel.episode,
        image: characterModel.image,
        location: characterModel.location,
        species: characterModel.species,
        status: characterModel.status,
      );
}
