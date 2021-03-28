import 'package:flutter/material.dart';

import 'configure.dart';
import 'presenter/list_character/list_character_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListCharacterPage());
  }
}
