import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../model/character_model.dart';
import 'character_datasource.dart';

class CharacterDatasourceImpl implements CharacterDatasource {
  final Dio dio;

  CharacterDatasourceImpl({@required this.dio});

  Future<List<CharacterModel>> get({int page = 1}) async {
    final res = await dio.get('/character', queryParameters: {'page': page});
    List results = res.data['results'];
    return results.map((item) => CharacterModel.fromJSON(item)).toList();
  }
}
