import 'package:flutter/material.dart';
import 'package:flutter_qr_maps/models/scan_model.dart';
import 'package:flutter_qr_maps/providers/providers.dart';
import 'package:flutter_qr_maps/screens/screens.dart';
import 'package:flutter_qr_maps/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                scanListProvider.borrarTodos();
              },
              icon: const Icon(
                Icons.delete_forever,
              ))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambair para msotrar la pagina que es
    final currentindex = uiProvider.selectedMenuOpt;

    //TODO quitar de aqui
    //final tempScan = ScanModel(valor: 'hola');
    //DbProvider.db.nuevoScan(tempScan);
    //DbProvider.db.getTodosLosScans().then((value) => print(value));

    //No quieor que se me redibuje
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentindex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasScreen();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesScreen();

      default:
        return MapasScreen();
    }
  }
}
