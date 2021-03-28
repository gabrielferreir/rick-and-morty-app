import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'episodes_bloc.dart';
import 'episodes_content.dart';
import 'episodes_event.dart';

class EpisodesPage extends StatelessWidget {
  final int episode;

  EpisodesPage({@required this.episode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EpisodesBloc>(
      create: (context) =>
          GetIt.I.get<EpisodesBloc>()..add(Started(id: episode)),
      child: EpisodesContent(),
    );
  }
}
