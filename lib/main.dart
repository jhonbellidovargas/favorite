import 'package:favorite/pages/home_kilometers_page.dart';
import 'package:favorite/providers/general_provider.dart';
import 'package:favorite/widgets/common/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GeneralProvider()),
      ],
      child:
          const MaterialApp(title: 'Material App', home: HomeKilometersPage()),
    );
  }
}
