import 'package:favorite/pages/cart_page.dart';
import 'package:favorite/pages/home_kilometers_page.dart';
import 'package:favorite/pages/product_details_page.dart';
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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KiloMeters',
          initialRoute: 'home',
          // initialRoute: 'cart',
          routes: {
            'home': (_) => const HomeKilometersPage(),
            'details': (_) => const ProductDetailsPage(),
            'cart': (_) => const CartPage(),
          }),
    );
  }
}
