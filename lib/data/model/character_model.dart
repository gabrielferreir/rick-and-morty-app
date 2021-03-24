import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CharacterModel extends Equatable {
  final int id;
  final String name;
  final List<dynamic> episode;
  final String status;
  final String location;
  final String origin;
  final String species;
  final String gender;
  final String image;

  CharacterModel(
      {@required this.id,
      @required this.name,
      @required this.episode,
      @required this.status,
      @required this.location,
      @required this.origin,
      @required this.species,
      @required this.gender,
      @required this.image});

  CharacterModel.fromJSON(json)
      : this.id = json['id'],
        this.name = json['name'],
        this.episode = json['episode'],
        this.status = json['status'],
        this.location = json['location']['name'],
        this.origin = json['origin']['name'],
        this.species = json['species'],
        this.gender = json['gender'],
        this.image = json['image'];

  @override
  List<Object> get props =>
      [id, name, status, location, origin, species, gender, image];
}
