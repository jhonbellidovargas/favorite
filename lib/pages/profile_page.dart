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

    // mosyrwmos las direcciones
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
                  : ListView.builder(
                      itemCount: generalProvider.addresses.length,
                      itemBuilder: (context, index) {
                        final address = generalProvider.addresses[index];
                        return _AddressCard(address);
                      },
                    ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressModel address;

  const _AddressCard(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(address.address),
    );
  }
}
