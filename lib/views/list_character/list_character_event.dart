import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListCharacterEvent extends Equatable {
  ListCharacterEvent([List props = const []]) : super(props);
}

class Started extends ListCharacterEvent {}

class Fetch extends ListCharacterEvent {
  final int page;

  Fetch({@required this.page});
}
