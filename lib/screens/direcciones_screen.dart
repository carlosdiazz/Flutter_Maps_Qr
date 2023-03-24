import 'package:flutter/material.dart';
import 'package:flutter_qr_maps/widgets/widgets.dart';

class DireccionesScreen extends StatelessWidget {
  const DireccionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}
