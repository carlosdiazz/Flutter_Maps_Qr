import 'package:flutter/material.dart';
import 'package:flutter_qr_maps/models/scan_model.dart';
import 'package:flutter_qr_maps/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lanzarUrl(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http') {
    final Uri url = Uri.parse(scan.valor);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    } else {
      await launchUrl(url);
    }
  } else {
    Navigator.pushNamed(context, AppRoute.mapaRoute, arguments: scan);
  }
}
