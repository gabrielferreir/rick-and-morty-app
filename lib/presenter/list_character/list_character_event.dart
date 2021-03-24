import 'package:meta/meta.dart';

@immutable
abstract class ListCharacterEvent {}

class Started extends ListCharacterEvent {}

class Fetch extends ListCharacterEvent {
  final int page;

  Fetch({@required this.page});
}
