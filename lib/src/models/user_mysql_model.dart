class UserMysql {
  final String nombres;
  final String cedula;
  final String correo;
  final String direccion;
  final String direccion1;
  final String plan;
  final String idc;
  final String id_company;

  UserMysql(this.nombres, this.cedula,this.correo,this.direccion,this.direccion1,this.plan,this.idc,this.id_company);

  UserMysql.fromJson(Map<String, dynamic> json)
      : nombres = json['nombres'],
        cedula = json['cedula'],
        correo= json['correo'],
        direccion=json['direccion'],
        direccion1=json['direccion1'],
        plan=json['plan'],
        idc=json['idc'],
  id_company=json['id_company'];
}
