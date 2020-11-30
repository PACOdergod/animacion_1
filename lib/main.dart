import 'package:animaciones_app/pages/animaciones_pages.dart';
import 'package:animaciones_app/pages/circular_prog_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animaciones',
      home: CircularProgPage(),
    );
  }
}
