import 'package:equatable/equatable.dart';

class CharacterState extends Equatable {
  final bool isLoading;
  final bool isFavorite;
  final String? message;

  CharacterState({
    this.isLoading = false,
    this.isFavorite = false,
    this.message,
  });

  @override
  List get props => [isLoading, isFavorite, message];
}
