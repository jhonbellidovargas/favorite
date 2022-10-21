import 'package:favorite/models/cart_model.dart';
import 'package:favorite/providers/general_provider.dart';
import 'package:favorite/utils/styles.dart';
import 'package:favorite/utils/utils.dart';
import 'package:favorite/widgets/common/general_image.dart';
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
                  ? const Center(child: Text('No hay productos'))
                  : Column(
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
                                      itemCount:
                                          generalProvider.cart!.producs.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: mqHeigth(context, 2),
                                              horizontal: mqWidth(context, 5)),
                                          margin: EdgeInsets.symmetric(
                                              vertical: mqHeigth(context, 1)),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: const Offset(0, 1))
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  GeneralImage(
                                                    height:
                                                        mqHeigth(context, 10),
                                                    width:
                                                        mqHeigth(context, 10),
                                                    url: generalProvider
                                                        .cart!
                                                        .producs[index]
                                                        .photos[0],
                                                    borderRadius: 15,
                                                  ),
                                                  VSpacing(
                                                      mqHeigth(context, 2)),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        generalProvider
                                                            .cart!
                                                            .producs[index]
                                                            .title,
                                                      ),
                                                      VSpacing(
                                                          mqHeigth(context, 1)),
                                                      Text(
                                                        '\s/. ${generalProvider.cart!.producs[index].value}',
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      generalProvider
                                                          .cart!.producs
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete))
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                              VSpacing(mqHeigth(context, 1)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total',
                                  ),
                                  Text(
                                    '\s/. ${totalPrice}',
                                  ),
                                ],
                              ),
                              VSpacing(mqHeigth(context, 1)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Delivery',
                                  ),
                                  Text(
                                    '\s/. ${generalProvider.cart?.deliveryPrice}',
                                  ),
                                ],
                              ),
                              VSpacing(mqHeigth(context, 1)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total',
                                  ),
                                  Text(
                                    '\s/. ${totalPrice + generalProvider.cart!.deliveryPrice}',
                                  ),
                                ],
                              ),
                              VSpacing(mqHeigth(context, 2)),
                              Container(
                                width: double.infinity,
                                height: mqHeigth(context, 7),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Checkout',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
    );
  }
}
