import 'character_model.dart';

class EpisodesModel {
  final int id;
  final String name;
  final String episode;
  final String airDate;
  List<CharacterModel> list;

  EpisodesModel.fromJSON(json)
      : id = json['id'],
        name = json['name'],
        episode = json['episode'],
        airDate = json['air_date'],
        list = json['list'];
}
