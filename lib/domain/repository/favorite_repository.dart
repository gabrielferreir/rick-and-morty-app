abstract class FavoriteRepository {
  Future<List<int>> getAll();

  Future<void> save({required int id});

  Future<bool> isFavorite({required int id});
}
