import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/model/character_model.dart';

class EpisodesModel extends Equatable {
  final int id;
  final String name;
  final String episode;
  final String airDate;
  List<Character> list;

  EpisodesModel(
      {@required this.id,
      @required this.name,
      @required this.episode,
      @required this.airDate,
      @required this.list})
      : super([id, name, episode, airDate, list]);

  EpisodesModel.fromJSON(json)
      : this.id = json['id'],
        this.name = json['name'],
        this.episode = json['episode'],
        this.airDate = json['air_date'],
        this.list = json['list'],
        super([
          json['id'],
          json['name'],
          json['episode'],
          json['air_date'],
          json['list']
        ]);
}
