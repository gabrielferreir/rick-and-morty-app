import 'package:meta/meta.dart';

@immutable
abstract class EpisodesEvent {}

class Started extends EpisodesEvent {
  final int id;

  Started({@required this.id});
}
