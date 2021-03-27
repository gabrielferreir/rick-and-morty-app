import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EpisodesEvent extends Equatable {
  const EpisodesEvent();
}

class Started extends EpisodesEvent {
  final int id;

  const Started({@required this.id});

  @override
  List<Object> get props => [id];
}
