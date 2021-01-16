import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'dart:async';

import '../data/models/character_model.dart';
import '../data/datasource/list_character_data_source.dart';

@LazySingleton(as: ListCharacterDataSource)
class ListCharacterDataSourceImpl implements ListCharacterDataSource {
  final Dio dio;

  ListCharacterDataSourceImpl({
    this.dio,
  }) : assert(dio != null);

  @override
  Future<List<CharacterModel>> search() async {
    try {
      final mapJson = [{
        "id": 361,
        "name": "Toxic Rick",
        "status": "Dead",
        "gender": "Male",
      }];
      return CharacterModel.fromJsonList(mapJson);
    } on DioError catch (e) {
      throw e.response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
