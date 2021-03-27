import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  Line({@required this.title, @required this.subtitle, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0),
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
