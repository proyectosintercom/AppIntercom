class UserFinansys {
  final String nombre;
  final String cedula;
  final String idc;

  UserFinansys(this.nombre, this.cedula,this.idc);

  UserFinansys.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        cedula = json['cedula'],
        idc= json['idc'];
}
