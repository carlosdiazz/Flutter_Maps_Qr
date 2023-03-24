import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qr_maps/providers/providers.dart';
import 'package:flutter_qr_maps/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //    '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        const barcodeScanRes = 'hhtps://Hola.com';
        const barcodeScanRes2 = 'geo:19.215961,-70.519763';

        if (barcodeScanRes == '-1') {
          return;
        }
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        final nuevoScan2 = await scanListProvider.nuevoScan(barcodeScanRes2);

        lanzarUrl(context, nuevoScan2);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
