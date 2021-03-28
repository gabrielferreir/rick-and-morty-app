import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final List<dynamic> episode;
  final String status;
  final String location;
  final String origin;
  final String species;
  final String gender;
  final String image;

  Character(
      {@required this.id,
      @required this.name,
      @required this.episode,
      @required this.status,
      @required this.location,
      @required this.origin,
      @required this.species,
      @required this.gender,
      @required this.image});

  @override
  List<Object> get props =>
      [id, name, status, location, origin, species, gender, image];
}
