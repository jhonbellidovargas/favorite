import 'package:favorite/pages/home_categories_page.dart';
import 'package:favorite/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeKilometersPage extends StatelessWidget {
  const HomeKilometersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: mqHeigth(context, 100),
      child: PageView(
        children: [
          HomeCategoriesPage(),
        ],
      ),
    ));
  }
}
