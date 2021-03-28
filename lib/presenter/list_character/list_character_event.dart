import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ListCharacterEvent extends Equatable {
  const ListCharacterEvent();

  @override
  List<Object> get props => [];
}

class Started extends ListCharacterEvent {
  const Started();
}

class Fetch extends ListCharacterEvent {
  final int page;

  const Fetch({@required this.page});

  @override
  List<Object> get props => [page];
}
