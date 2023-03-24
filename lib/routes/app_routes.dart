import 'package:flutter/material.dart';
import 'package:flutter_qr_maps/screens/screens.dart';

class AppRoute {
  static const initialRoute = 'home';
  static const mapaRoute = 'mapa';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutess = {
      initialRoute: (_) => const HomeScreen(),
      mapaRoute: (_) => const MapaScreen()
    };
    return appRoutess;
  }
}
