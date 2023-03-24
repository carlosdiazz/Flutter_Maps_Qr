import 'package:flutter/material.dart';
import 'package:flutter_qr_maps/models/models.dart';
import 'package:flutter_qr_maps/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DbProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scansNew = await DbProvider.db.getTodosLosScans();
    scans = [...scansNew];
  }

  cargarScanPorTipo(String tipo) async {
    final scansTipo = await DbProvider.db.getScansPorTipo(tipo);
    scans = [...scansTipo];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DbProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DbProvider.db.deleteScan(id);
    cargarScanPorTipo(tipoSeleccionado);
  }
}
