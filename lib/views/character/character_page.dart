import 'package:flutter/material.dart';
import 'package:rickandmorty/model/character_model.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  CharacterPage({@required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4d4669),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 32.0,
                                      backgroundImage:
                                          NetworkImage(character.image)),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(character.name,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(character.species,
                                                style:
                                                    TextStyle(fontSize: 16.0))
                                          ]))
                                ]),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Divider(),
                            ),
                            // --------------------------------
                            Container(
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          ItemHeader(
                                              title: 'Status',
                                              subtitle: 'Alive'),
                                          ItemHeader(
                                              title: 'Gender',
                                              subtitle: character.gender),
                                          ItemHeader(
                                              title: 'Episodes',
                                              subtitle: character.episode.length
                                                  .toString())
                                        ])))
                          ])))),
              Line(
                  title: 'Location',
                  subtitle: character.location,
                  icon: Icons.location_on),
              Line(
                  title: 'Origin',
                  subtitle: character.origin,
                  icon: Icons.location_city),
              Episodes(episodes: character.episode)
            ])));
  }
}

class Episodes extends StatelessWidget {
  final List episodes;
  static final RegExp numberRegExp = RegExp(r'\d+');

  Episodes({@required this.episodes});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 0.0, left: 0.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                      child: Icon(Icons.movie,
                          color: Color(0xff4d4669), size: 32.0)),
                  Text('Episodios',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                ],
              ),
              Column(
                children: episodes
                    .map((item) => ListTile(
                        trailing: IconButton(
                            icon: Icon(Icons.arrow_forward), onPressed: () {}),
                        title: Text(
                          'Episodio ${numberRegExp.stringMatch(item)}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        )))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  ItemHeader({@required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title ?? '',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
        Text(subtitle ?? '',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black54)),
      ],
    );
  }
}

class Line extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  Line({@required this.title, @required this.subtitle, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(icon, color: Color(0xff4d4669), size: 32.0)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600)),
                        Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(subtitle,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black87)))
                      ])
                ]))));
  }
}
