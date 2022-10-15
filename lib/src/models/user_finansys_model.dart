class UserFinansys {
  final String nombre;
  final String cedula;
  final String idc;
  final String company;
  final double total;


  UserFinansys(this.nombre, this.cedula,this.idc,this.total,this.company);

  UserFinansys.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        cedula = json['cedula'],
        idc= json['idc'],
        total=json['total'],
        company=json['company'];
}
