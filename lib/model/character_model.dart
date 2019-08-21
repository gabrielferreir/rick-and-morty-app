import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  Character(
      {@required this.id,
      @required this.name,
      @required this.status,
      @required this.species,
      @required this.gender,
      @required this.image})
      : super([id, name, status, species, gender, image]);

  Character.fromJSON(json)
      : this.id = json['id'],
        this.name = json['name'],
        this.status = json['status'],
        this.species = json['species'],
        this.gender = json['gender'],
        this.image = json['image'],
        super([
          json['id'],
          json['name'],
          json['status'],
          json['species'],
          json['gender'],
          json['image']
        ]);
}
