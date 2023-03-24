import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  int? id;
  String tipo;
  String valor;

  LatLng getLatLng() {
    final latLng = valor.substring(4).split(',');

    bool esSoloNumeros(String texto) {
      final RegExp regex = RegExp(r'^\d+$');
      return regex.hasMatch(texto);
    }

    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);
    return LatLng(lat, lng);

    //if (esSoloNumeros == true) {
    //  final lat = double.parse(latLng[0]);
    //  final lng = double.parse(latLng[1]);
    //  return LatLng(lat, lng);
    //} else {
    //  final lat = double.parse(latLng[0]);
    //  final lng = double.parse(latLng[1]);
    //}
  }

  ScanModel({
    this.id,
    this.tipo = '',
    required this.valor,
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json["id"],
      tipo: json["tipo"],
      valor: json["valor"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tipo": tipo,
      "valor": valor,
    };
  }
}
