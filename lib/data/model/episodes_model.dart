import 'package:meta/meta.dart';
import 'package:rickandmorty/data/model/character_model.dart';

class EpisodesModel {
  final int id;
  final String name;
  final String episode;
  final String airDate;
  List<CharacterModel> list;

  EpisodesModel(
      {@required this.id,
      @required this.name,
      @required this.episode,
      @required this.airDate,
      @required this.list});

  EpisodesModel.fromJSON(json)
      : this.id = json['id'],
        this.name = json['name'],
        this.episode = json['episode'],
        this.airDate = json['air_date'],
        this.list = json['list'];
}
