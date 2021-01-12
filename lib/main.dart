import 'package:chatex/ui/themes/main/theme.dart';
import 'package:chatex/ui/views/initial_page.dart';
import 'package:flutter/material.dart';
import 'di/config.dart' as config;

void main() async {
  //await config.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SS',
      home: InitialPage(),
      theme: mainTheme,
    );
  }
}
