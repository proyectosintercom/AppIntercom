class Userchatbot {
  final String key;
  final String value;
  final String estado;
  final String direccion;
  final String unidad;
  final String saldo;
  final String fecha_corte;

  Userchatbot(this.key, this.value, this.estado, this.direccion, this.unidad,this.saldo, this.fecha_corte);

  Userchatbot.fromJson(Map<String, dynamic> json)
      : key= json['key'],
        value = json['value'],
        estado= json['estado'],
        direccion=json['direccion'],
        unidad=json['unidad'],
          saldo=json['saldo'],
        fecha_corte=json['fecha_corte'];
}

