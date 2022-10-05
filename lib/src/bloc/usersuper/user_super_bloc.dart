import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data_source/rest_data_mysql.dart';
import '../../models/user_mysql_model.dart';

part 'user_super_event.dart';
part 'user_super_state.dart';

class UserSuperBloc extends Bloc<UserSuperEvent, UserSupernetState> {
  UserSuperBloc() : super(UserSupernetState()) {
    on<UserSuperEvent>((event, emit) {
      if (event is VerifyUserMysql) {
        Future<UserMysql> datosMysql(usuario) async {
          final dataSource = RestDataSourceMySql();
          final user = await dataSource.getName(usuario);
          //print(user.correo);
          print(user.cedula);
          return user;
        }
      }
    });
  }
}
