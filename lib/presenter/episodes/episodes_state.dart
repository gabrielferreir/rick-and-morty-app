import 'package:meta/meta.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';

@immutable
abstract class EpisodesState {}

class Loading extends EpisodesState {}

class Loaded extends EpisodesState {
  final Episodes episodes;

  Loaded({@required this.episodes});
}
