import 'package:flutter/material.dart';

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
