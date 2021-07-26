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
  Future<bool> save({required int id}) async {
    final list = await getAll();
    var newList = [];
    var isAdded = false;
    if (list.contains(id)) {
      isAdded = false;
      newList = list.where((e) => e != id).toList();
    } else {
      isAdded = true;
      newList = [
        ...list.map((e) => e.toString()),
        id.toString(),
      ];
    }
    await sharedPreferences.setStringList(
        'favorites', newList.map((e) => e.toString()).toList());

    return isAdded;
  }
}
