import 'package:favorite/models/orders_model.dart';
import 'package:favorite/providers/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GeneralProvider>(context, listen: false).getOrders(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final generalProvider = Provider.of<GeneralProvider>(context);
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
        title: const Text(
          'Mis Ordenes',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: generalProvider.ordersLoading
          ? const Center(child: CircularProgressIndicator())
          : generalProvider.ordersError
              ? const Center(child: Text('Error al cargar las ordenes'))
              : generalProvider.orders.isEmpty
                  ? const Center(child: Text('No hay ordenes'))
                  : ListView.builder(
                      itemCount: generalProvider.orders.length,
                      itemBuilder: (context, index) {
                        final order = generalProvider.orders[index];
                        return _OrderCard(order);
                      },
                    ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderModel order;
  const _OrderCard(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Número de orden'),
                Text(
                  order.id.toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Fecha de compra'),
                // Fecha formateada a 16 de marzo de 2021
                Text(
                    '${order.createdAt.day} de ${order.createdAt.month} de ${order.createdAt.year}'),
              ],
            ),
            Column(
              children: [
                // Se muestra el estado con fondo naranja redondeado y texto centrado
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      order.state,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Text('Total ${order.totalValiue} Kms'),
              ],
            )
          ],
        ));
  }
}
