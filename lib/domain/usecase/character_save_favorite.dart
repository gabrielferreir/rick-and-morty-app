import '../repository/favorite_repository.dart';

abstract class CharacterSaveFavoriteUseCase {
  Future<bool> call({required int id});
}

class CharacterSaveFavoriteUseCaseImpl implements CharacterSaveFavoriteUseCase {
  final FavoriteRepository favoriteRepository;

  const CharacterSaveFavoriteUseCaseImpl({required this.favoriteRepository});

  @override
  Future<bool> call({required int id}) => favoriteRepository.save(id: id);
}
