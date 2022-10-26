import 'package:favorite/pages/address_edit_page.dart';
import 'package:favorite/pages/cart_page.dart';
import 'package:favorite/pages/home_kilometers_page.dart';
import 'package:favorite/pages/orders_page.dart';
import 'package:favorite/pages/product_details_page.dart';
import 'package:favorite/pages/profile_page.dart';
import 'package:favorite/providers/general_provider.dart';
import 'package:favorite/providers/ui_provider.dart';
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
        ChangeNotifierProvider(
          create: (context) => GeneralProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UiProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KiloMeters',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeKilometersPage(),
          'details': (context) => const ProductDetailsPage(),
          'cart': (context) => const CartPage(),
          'orders': (context) => const OrdersPage(),
          'profile': (context) => const ProfilePage(),
          'address': (context) => const AddressPage(),
        },
      ),
    );
  }
}
