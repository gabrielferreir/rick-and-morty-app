
import '../../domain/entities/episodes.dart';
import '../../domain/repository/episodes_repository.dart';
import '../datasource/episodes_datasource.dart';
import '../mapper/episodes_mapper.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesDatasource episodesDatasource;
  final EpisodesMapper episodesMapper;

  EpisodesRepositoryImpl({
    required this.episodesDatasource,
    required this.episodesMapper,
  });

  Future<Episodes> get({
    required int id,
  }) async {
    final episodesModel = await episodesDatasource.get(id: id);
    return episodesMapper.handle(episodesModel);
  }
}
