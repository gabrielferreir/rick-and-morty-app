import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff4d4669),
        child: Center(child: Image.asset('images/loading.gif')));
  }
}
