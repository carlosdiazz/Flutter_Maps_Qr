import 'package:flutter/material.dart';
import 'package:flutter_qr_maps/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_maps/providers/providers.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({super.key, required this.tipo});
  final String tipo;

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                scanListProvider.borrarScanPorId(scans[index].id!);
              },
              child: ListTile(
                  leading: Icon(
                    tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(scans[index].valor),
                  subtitle: Text(scans[index].id.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => lanzarUrl(context, scans[index])),
            ));
  }
}
