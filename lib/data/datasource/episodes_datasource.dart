import '../model/episodes_model.dart';

abstract class EpisodesDatasource {
  Future<EpisodesModel> get({int id});
}
