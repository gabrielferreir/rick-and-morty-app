import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/domain/entities/episodes.dart';

@immutable
abstract class EpisodesState {}

class Loading extends EpisodesState {}

class Loaded extends Equatable implements EpisodesState {
  final Episodes episodes;

  Loaded({@required this.episodes});

  @override
  List<Object> get props => [episodes];
}

class WithError extends Equatable implements EpisodesState {
  final String message;

  WithError({@required this.message});

  @override
  List<Object> get props => [message];
}
