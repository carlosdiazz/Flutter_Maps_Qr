class ScanModel {
  int? id;
  String tipo;
  String valor;

  ScanModel({
    this.id,
    this.tipo = '',
    required this.valor,
  }) {
    if (valor.contains('hhtp')) {
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
