import 'package:flutter/material.dart';
import 'package:rickandmorty/presenter/episodes/episodes_page.dart';

class EpisodesCard extends StatelessWidget {
  final List episodes;
  static final RegExp numberRegExp = RegExp(r'\d+');

  EpisodesCard({
    @required this.episodes,
  });

  _openBottomSheet(
    BuildContext context, {
    @required String episode,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        )),
        elevation: 2.0,
        context: context,
        builder: (context) => Container(
              height: 220.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: EpisodesPage(
                        episode: int.parse(numberRegExp.stringMatch(episode))),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 16.0, left: 16.0, top: 12.0),
        width: double.infinity,
        child: Card(
            child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 0.0, left: 0.0),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Icon(Icons.movie,
                            color: Color(0xff4d4669), size: 32.0)),
                    Text('Episodios',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87))
                  ]),
                  Column(
                      children: episodes
                          .map((item) => ListTile(
                              trailing: IconButton(
                                  key: Key('episode_card_ep_$item'),
                                  icon: Icon(Icons.arrow_forward),
                                  onPressed: () =>
                                      _openBottomSheet(context, episode: item)),
                              title: Text(
                                  'Episodio ${numberRegExp.stringMatch(item)}',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500))))
                          .toList())
                ]))));
  }
}
