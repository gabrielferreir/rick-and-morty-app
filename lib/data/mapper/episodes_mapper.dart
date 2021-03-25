import 'package:meta/meta.dart';
import 'package:rickandmorty/data/mapper/character_mapper.dart';
import 'package:rickandmorty/data/model/episodes_model.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';

class EpisodesMapper {
  final CharacterMapper characterMapper;

  EpisodesMapper({
    @required this.characterMapper,
  });

  Episodes handle(EpisodesModel episodesModel) => Episodes(
        id: episodesModel.id,
        episode: episodesModel.episode,
        name: episodesModel.name,
        airDate: episodesModel.airDate,
        list: episodesModel.list.map((e) => characterMapper.handle(e)).toList(),
      );
}
