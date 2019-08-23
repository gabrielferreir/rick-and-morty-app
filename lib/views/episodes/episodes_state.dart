import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/model/episodes_model.dart';

@immutable
abstract class EpisodesState extends Equatable {
  EpisodesState([List props = const []]) : super(props);
}

class Loading extends EpisodesState {}

class Loaded extends EpisodesState {
  final EpisodesModel episodesModel;

  Loaded({@required this.episodesModel});
}
