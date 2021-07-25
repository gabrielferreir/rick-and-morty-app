import '../entities/episodes.dart';

abstract class EpisodesRepository {
  Future<Episodes> get({int id});
}
