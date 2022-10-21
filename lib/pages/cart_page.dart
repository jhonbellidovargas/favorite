import 'package:favorite/models/cart_model.dart';
import 'package:favorite/models/product_model.dart';
import 'package:favorite/providers/general_provider.dart';
import 'package:favorite/utils/styles.dart';
import 'package:favorite/utils/utils.dart';
import 'package:favorite/widgets/common/general_image.dart';
import 'package:favorite/widgets/common/h_spacing.dart';
import 'package:favorite/widgets/common/v_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/categories/notification_icon.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GeneralProvider>(context, listen: false).getCart(1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final generalProvider = Provider.of<GeneralProvider>(context);
    totalPrice = generalProvider.cart != null
        ? generalProvider.cart!.producs.fold(
            0, (previousValue, element) => previousValue + (element.value))
        : 0;
    // si la cartloading es true, entonces se muestra el loading
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Mi Carrito',
              style: TextStyle(color: Colors.black),
            ),
            const VSpacing(10),
            GeneralImage(
                height: mqHeigth(context, 5),
                width: mqWidth(context, 40),
                url: ''),
            const NotificationIcon()
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: generalProvider.cartLoading
          ? const Center(child: CircularProgressIndicator())
          : generalProvider.cartError
              ? const Center(child: Text('Error'))
              : generalProvider.cart == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      width: double.infinity,
                      color: Colors.yellow,
                      child: const Text(
                        'No hay productos en el carrito',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            width: double.infinity,
                            color: Colors.yellow,
                            child: Text(
                              'Tiene ${generalProvider.cart!.producs.length} Productos',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: mqHeigth(context, 2),
                                horizontal: mqWidth(context, 5)),
                            color: Colors.white,
                            child: Column(
                              children: [
                                generalProvider.cart == null
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: generalProvider
                                            .cart!.producs.length,
                                        itemBuilder: (context, index) {
                                          return _CartItem(
                                              generalProvider
                                                  .cart!.producs[index],
                                              index);
                                        },
                                      ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: mqHeigth(context, 2),
                                horizontal: mqWidth(context, 5)),
                            margin: EdgeInsets.symmetric(
                                vertical: mqHeigth(context, 1)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: Colors.grey.withOpacity(0.5)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Total ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    HSpacing(mqHeigth(context, 1)),
                                    Text(
                                      ' ${generalProvider.cart!.deliveryPrice} Km',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      // tamaño de letra
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'payment');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow,
                                      onPrimary: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  child: const Text('Canjear'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final ProductModel product;
  final int index;

  const _CartItem(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    final generalProvider = Provider.of<GeneralProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: mqHeigth(context, 0), horizontal: mqWidth(context, 0)),
      margin: EdgeInsets.symmetric(vertical: mqHeigth(context, 1)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: mqHeigth(context, 18),
            width: mqWidth(context, 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(product.photos[0]), fit: BoxFit.cover)),
          ),
          Container(
            width: mqWidth(context, 50),
            height: mqHeigth(context, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                ),
                Text(
                  '${product.value}',
                ),
                Container(
                  width: mqWidth(context, 25),
                  height: mqHeigth(context, 7),
                  padding: EdgeInsets.symmetric(
                      vertical: mqHeigth(context, 1),
                      horizontal: mqWidth(context, 1)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                      HSpacing(mqWidth(context, 2)),
                      Text(
                        '${product.value}',
                      ),
                      HSpacing(mqWidth(context, 2)),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
