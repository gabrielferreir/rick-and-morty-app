import '../repository/favorite_repository.dart';

abstract class CharacterIsFavoriteUseCase {
  Future<bool> call({required int id});
}

class CharacterIsFavoriteUseCaseImpl implements CharacterIsFavoriteUseCase {
  final FavoriteRepository favoriteRepository;

  const CharacterIsFavoriteUseCaseImpl({required this.favoriteRepository});

  @override
  Future<bool> call({required int id}) => favoriteRepository.isFavorite(id: id);
}
