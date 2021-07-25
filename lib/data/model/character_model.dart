class CharacterModel {
  final int id;
  final String name;
  final List<dynamic> episode;
  final String status;
  final String location;
  final String origin;
  final String species;
  final String gender;
  final String image;

  CharacterModel.fromJSON(json)
      : id = json['id'],
        name = json['name'],
        episode = json['episode'],
        status = json['status'],
        location = json['location']['name'],
        origin = json['origin']['name'],
        species = json['species'],
        gender = json['gender'],
        image = json['image'];
}
