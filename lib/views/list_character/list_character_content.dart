import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/components/item_grid.dart';
import 'package:rickandmorty/views/list_character/bloc.dart';

class ListCharacterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCharacterBloc, ListCharacterState>(
      builder: (context, state) {
        if (state is Loading)
          return Center(child: CircularProgressIndicator());
        if(state is Loaded)
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(16.0),
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 1 / 1.1,
                      children: state.list.map((item) => ItemGrid(character: item)).toList())));
        return Container();
      },
    );
  }
}
