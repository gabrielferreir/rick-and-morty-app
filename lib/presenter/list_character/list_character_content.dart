import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../shared/item_grid.dart';

import 'list_character_bloc.dart';
import 'list_character_state.dart';

class ListCharacterContent extends StatefulWidget {
  @override
  _ListCharacterContentState createState() => _ListCharacterContentState();
}

class _ListCharacterContentState extends State<ListCharacterContent> {
  final ScrollController _scrollController = ScrollController();

  void scrollEvent() {
    final state = BlocProvider.of<ListCharacterCubit>(context).state;
    if (!state.loading && !state.finish) {
      final isLoading = state.loading;
      final page = state.page;
      var triggerFetchMoreSize =
          0.9 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (!isLoading) {
          BlocProvider.of<ListCharacterCubit>(context)..fetch(page: page + 1);
        }
      }
    }
  }

  @override
  void initState() {
    _scrollController.addListener(scrollEvent);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCharacterCubit, ListCharacterState>(
        builder: (context, state) {
      if (state.message != null) {
        return Center(
            child: Text(state.message!,
                key: Key('list_character_errors_message')));
      }
      if (!state.isLoading && state.message == null) {
        return Container(
            key: Key('list_character_container_loaded'),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0))),
            child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(children: [
                  Expanded(
                      child: GridView.builder(
                          key: Key('list_character_grid_list'),
                          controller: _scrollController,
                          itemCount: state.list.length % 2 == 0
                              ? state.list.length + 2
                              : state.list.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  childAspectRatio: 1 / 1.2),
                          padding: const EdgeInsets.all(16.0),
                          itemBuilder: (context, index) {
                            if (index >= state.list.length) {
                              return state.finish
                                  ? Container()
                                  : Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(color: Colors.white));
                            }
                            return ItemGrid(character: state.list[index]);
                          }))
                ])));
      }
      return Center(
          child: CircularProgressIndicator(key: Key('list_character_loading')));
    });
  }
}
