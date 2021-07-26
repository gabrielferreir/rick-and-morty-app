import 'package:shared_preferences/shared_preferences.dart';

import 'favorite_datasource.dart';

class FavoriteDatasourceImpl implements FavoriteDatasource {
  final SharedPreferences sharedPreferences;

  FavoriteDatasourceImpl({required this.sharedPreferences});

  @override
  Future<List<int>> getAll() async {
    final list = await sharedPreferences.getStringList('favorites') ?? [];
    return list.map(int.parse).toList();
  }

  @override
  Future<bool> isFavorite({required int id}) async {
    final list = await getAll();
    return list.contains(id);
  }

  @override
  Future<void> save({required int id}) async {
    final list = await getAll();
    final listMapped = [
      ...list.map((e) => e.toString()),
      id.toString(),
    ];
    await sharedPreferences.setStringList('favorites', listMapped);
  }
}
