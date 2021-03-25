import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/presenter/shared/item_grid.dart';

import 'list_character_bloc.dart';
import 'list_character_event.dart';
import 'list_character_state.dart';

class ListCharacterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCharacterBloc, ListCharacterState>(
        builder: (context, state) {
      if (state is Loading) return Center(child: CircularProgressIndicator());
      if (state is WithError) return Center(child: Text(state.message));
      if (state is Loaded)
        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0))),
            child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GridView.builder(
                    itemCount: state.list.length % 2 == 0
                        ? state.list.length + 2
                        : state.list.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 1 / 1.2),
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, index) {
                      if (index >= state.list.length) {
                        if (!state.loading && !state.finish)
                          BlocProvider.of<ListCharacterBloc>(context)
                              .add(Fetch(page: state.page + 1));
                        if (state.finish) return Container();
                        return Column(children: <Widget>[
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                          color: Color(0xff4d4669))))),
                          Container(width: double.infinity, height: 32.0)
                        ]);
                      }
                      return ItemGrid(character: state.list[index]);
                    })));
      return Container();
    });
  }
}
