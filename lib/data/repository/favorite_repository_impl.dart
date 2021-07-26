import '../../domain/repository/favorite_repository.dart';
import '../datasource/favorite_datasource.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDatasource favoriteDatasource;

  FavoriteRepositoryImpl({
    required this.favoriteDatasource,
  });

  Future<List<int>> getAll() => favoriteDatasource.getAll();

  Future<bool> save({required int id}) => favoriteDatasource.save(id: id);

  Future<bool> isFavorite({required int id}) =>
      favoriteDatasource.isFavorite(id: id);
}
