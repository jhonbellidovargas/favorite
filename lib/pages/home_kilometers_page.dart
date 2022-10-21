import 'package:favorite/pages/cart_page.dart';
import 'package:favorite/pages/home_categories_page.dart';
import 'package:favorite/pages/orders_page.dart';
import 'package:favorite/pages/profile_page.dart';
import 'package:favorite/providers/ui_provider.dart';
import 'package:favorite/utils/utils.dart';
import 'package:favorite/widgets/custom_navigatorbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeKilometersPage extends StatelessWidget {
  const HomeKilometersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    switch (uiProvider.selectedMenuOpt) {
      case 0:
        return Container(
          height: mqHeigth(context, 100),
          child: PageView(
            children: const [HomeCategoriesPage()],
          ),
        );
      case 1:
        return Container(
          height: mqHeigth(context, 100),
          child: PageView(
            children: const [OrdersPage()],
          ),
        );
      case 2:
        return Container(
          height: mqHeigth(context, 100),
          child: PageView(
            children: const [CartPage()],
          ),
        );
      case 3:
        return Container(
          height: mqHeigth(context, 100),
          child: PageView(
            children: const [ProfilePage()],
          ),
        );
      default:
        return const HomeCategoriesPage();
    }
  }
}
