import 'package:favorite/models/address_model.dart';
import 'package:favorite/providers/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GeneralProvider>(context, listen: false).getAddresses(1);
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
          'Mi Perfil',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: generalProvider.addressesLoading
          ? const Center(child: CircularProgressIndicator())
          : generalProvider.addressesError
              ? const Center(child: Text('Error al cargar las direcciones'))
              : generalProvider.addresses.isEmpty
                  ? const Center(child: Text('No hay direcciones'))
                  : SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://www.woolha.com/media/2020/03/eevee.png'),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Juan Perez',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text('+51 999 999 999'),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Mis direcciones',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'address');
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: generalProvider.addresses.length,
                                    itemBuilder: (context, index) {
                                      final AddressModel address =
                                          generalProvider.addresses[index];
                                      return _AddressCard(
                                          address, generalProvider);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Mis tarjetas',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return _CardCard();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressModel address;
  final GeneralProvider generalProvider;

  const _AddressCard(this.address, this.generalProvider);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(address.address),
              const SizedBox(height: 5),
              Text(address.latitude.toString()),
              const SizedBox(height: 5),
              Text(address.longitude.toString()),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'address', arguments: address);
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  if (address.main && generalProvider.addresses.length > 1) {
                    generalProvider.updateAddress(
                        generalProvider.addresses[1].id,
                        generalProvider.addresses[1].label,
                        generalProvider.addresses[1].latitude,
                        generalProvider.addresses[1].longitude,
                        true);
                    generalProvider.deleteAddress(address.id);
                  }
                  if (address.main && generalProvider.addresses.length == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No puedes eliminar tu unica direccion',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: Colors.yellow,
                      ),
                    );
                  } else {
                    generalProvider.deleteAddress(1);
                  }
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CardCard extends StatelessWidget {
  const _CardCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Tarjeta de credito',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('**** **** **** 1234'),
              SizedBox(height: 5),
              Text('Juan Perez'),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}
