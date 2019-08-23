import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/views/character/character_page.dart';

import 'bloc.dart';

class EpisodesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      builder: (context, state) {
        if (state is Loading)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (state is Loaded)
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(state.episodesModel.name,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ItemHeader(
                          title: 'Episode',
                          subtitle: state.episodesModel.episode),
                      ItemHeader(
                          title: 'Air Date',
                          subtitle: state.episodesModel.airDate)
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      children: state.episodesModel.list
                          .map((item) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Tooltip(
                                  message: item.name,
                                  child: CircleAvatar(
                                      backgroundImage: NetworkImage(item.image),
                                      radius: 32.0))))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          );
        return Container();
      },
    );
  }
}
