class UserMysql {
  final String nombres;
  final String cedula;
  final String correo;

  UserMysql(this.nombres, this.cedula,this.correo);

  UserMysql.fromJson(Map<String, dynamic> json)
      : nombres = json['nombres'],
        cedula = json['cedula'],
        correo= json['correo'];
}
