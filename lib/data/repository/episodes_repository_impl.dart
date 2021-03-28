import 'package:meta/meta.dart';
import 'package:rickandmorty/data/datasource/episodes_datasource.dart';
import 'package:rickandmorty/data/mapper/episodes_mapper.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';
import 'package:rickandmorty/domain/repository/episodes_repository.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesDatasource episodesDatasource;
  final EpisodesMapper episodesMapper;

  EpisodesRepositoryImpl({
    @required this.episodesDatasource,
    @required this.episodesMapper,
  });

  Future<Episodes> get({
    @required int id,
  }) async {
    final episodesModel = await episodesDatasource.get(id: id);
    return episodesMapper.handle(episodesModel);
  }
}
