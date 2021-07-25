import 'package:meta/meta.dart';
import '../entities/episodes.dart';
import '../repository/episodes_repository.dart';

mixin SearchEpisodeUseCase {
  Future<Episodes> call({@required int id});
}

class SearchEpisodeUseCaseImpl implements SearchEpisodeUseCase {
  final EpisodesRepository episodesRepository;

  const SearchEpisodeUseCaseImpl({
    @required this.episodesRepository,
  });

  @override
  Future<Episodes> call({@required int id}) async {
    return episodesRepository.get(id: id);
  }
}
