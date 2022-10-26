import 'package:favorite/models/address_model.dart';
import 'package:favorite/providers/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddressModel? address =
        ModalRoute.of(context)!.settings.arguments as AddressModel?;
    late AddressModel addressLocal = address ??
        AddressModel(
          id: 0,
          label: '',
          latitude: 0.0,
          longitude: 0.0,
          address: '',
          main: false,
        );

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
          'Dirección',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: address?.label ?? '',
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                    onChanged: (value) {
                      addressLocal.label = value;
                    },
                  ),
                  if (address == null)
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Dirección',
                      ),
                      onChanged: (value) {
                        addressLocal.address = value;
                      },
                    ),
                  TextFormField(
                    initialValue: address?.latitude.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Latitud',
                    ),
                    onChanged: (value) {
                      addressLocal.latitude = double.parse(value);
                    },
                  ),
                  TextFormField(
                    initialValue: address?.longitude.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Longitud',
                    ),
                    onChanged: (value) {
                      addressLocal.longitude = double.parse(value);
                    },
                  ),
                  if (address != null)
                    CheckboxListTile(
                      value: addressLocal.main,
                      onChanged: (value) {
                        addressLocal.main = value!;
                      },
                      title: const Text('Dirección principal'),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  if (addressLocal.id == 0) {
                    generalProvider.createAddress(
                        1,
                        addressLocal.label,
                        addressLocal.latitude,
                        addressLocal.longitude,
                        addressLocal.address);
                  } else {
                    generalProvider.updateAddress(
                        1,
                        addressLocal.label,
                        addressLocal.latitude,
                        addressLocal.longitude,
                        addressLocal.main);
                  }
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
