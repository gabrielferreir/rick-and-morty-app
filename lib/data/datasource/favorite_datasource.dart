abstract class FavoriteDatasource {
  Future<List<int>> getAll();

  Future<bool> save({required int id});

  Future<bool> isFavorite({required int id});
}
