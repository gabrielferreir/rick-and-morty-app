
import '../../domain/entities/episodes.dart';
import '../model/episodes_model.dart';
import 'character_mapper.dart';

class EpisodesMapper {
  final CharacterMapper characterMapper;

  EpisodesMapper({
    required this.characterMapper,
  });

  Episodes handle(EpisodesModel episodesModel) => Episodes(
        id: episodesModel.id,
        episode: episodesModel.episode,
        name: episodesModel.name,
        airDate: episodesModel.airDate,
        list: episodesModel.list!.map(characterMapper.handle).toList(),
      );
}
