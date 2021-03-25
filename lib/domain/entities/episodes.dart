import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'character.dart';

class Episodes extends Equatable {
  final int id;
  final String name;
  final String episode;
  final String airDate;
  final List<Character> list;

  Episodes({
    @required this.id,
    @required this.name,
    @required this.episode,
    @required this.airDate,
    @required this.list,
  });

  @override
  List<Object> get props => [
        id,
        name,
        episode,
        airDate,
        list,
      ];
}
