import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/character.dart';
import 'character_bloc.dart';
import 'character_content.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  CharacterPage({
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            GetIt.I.get<CharacterCubit>()..isFavorite(id: character.id),
        child: CharacterContent(character: character));
  }
}
