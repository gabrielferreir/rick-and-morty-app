import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EpisodesEvent extends Equatable {
  EpisodesEvent([List props = const []]) : super(props);
}

class Started extends EpisodesEvent {
  final int id;

  Started({@required this.id});
}
