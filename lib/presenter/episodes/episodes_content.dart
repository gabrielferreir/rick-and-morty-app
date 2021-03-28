import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/presenter/shared/clip_image.dart';
import 'package:rickandmorty/presenter/shared/item_header.dart';

import 'episodes_bloc.dart';
import 'episodes_state.dart';

class EpisodesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(builder: (context, state) {
      if (state is Loading)
        return Center(
            key: Key('episodes_loading'), child: CircularProgressIndicator());
      if (state is WithError)
        return Center(
            key: Key('episodes_error_message'), child: Text(state.message));
      if (state is Loaded) {
        return Padding(
            key: Key('episodes_container_loaded'),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(state.episodes.name,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87)))
              ]),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ItemHeader(
                            title: 'Episode', subtitle: state.episodes.episode),
                        ItemHeader(
                            title: 'Air Date', subtitle: state.episodes.airDate)
                      ])),
              SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      child: Row(
                          children: state.episodes.list
                              .map((item) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Tooltip(
                                    message: item.name,
                                    child: ClipImage(url: item.image),
                                  )))
                              .toList())))
            ]));
      }
      return Container();
    });
  }
}
