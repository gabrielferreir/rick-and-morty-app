import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/model/character_model.dart';

@immutable
abstract class ListCharacterState extends Equatable {
  ListCharacterState([List props = const []]) : super(props);
}

class Loading extends ListCharacterState {}

class Loaded extends ListCharacterState {
  final List<Character> list;

  Loaded({@required this.list});
}
