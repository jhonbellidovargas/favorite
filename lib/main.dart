import 'package:favorite/pages/home_kilometers_page.dart';
import 'package:favorite/widgets/common/scaffold_wrapper.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeKilometersPage()
    );
  }
}
