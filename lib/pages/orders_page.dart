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
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Número de orden',
                    style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
                Text(order.id.toString(),
                    style: const TextStyle(
                        fontSize: 20, color: Colors.blueAccent)),
                const SizedBox(
                  height: 10,
                ),
                const Text('Fecha de compra',
                    style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
                Text(
                  '${order.createdAt.day} de ${order.createdAt.month} de ${order.createdAt.year}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: 100,
                  decoration: BoxDecoration(
                      color: order.state == '1'
                          ? Colors.green
                          : order.state == '2'
                              ? Colors.orange
                              : Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      order.state == '1'
                          ? 'Procesando'
                          : order.state == '2'
                              ? 'Entregado'
                              : 'Cancelado',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Total ${order.totalValiue} Kms',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
