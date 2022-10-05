import 'package:appintercom/src/repository/auth_repository.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';

import '../data_source/rest_data_mysql.dart';
import '../models/user_mysql_model.dart';

Future<UserMysql> datosMysql(user) async {
  final dataSource = RestDataSourceMySql();
  final usuario = await dataSource.getName(user);
  //print(user.correo);
  print(usuario.cedula);
  return usuario;
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;
  late RestDataSourceMySql _ResrDataSource;

  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async {
    // Just for testing. Allows the splash screen to be shown a few seconds
    await Future.delayed(const Duration(seconds: 3));
    _authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  Future<void> reset() async => emit(AuthInitialState());

  Future<void> _authStateChanged(AuthUser? user) async {
    try {
      final usuario = 'uWb0PKBbhBZVirLh0bllk2ncDRp1hhhh';
      final dataSource = RestDataSourceMySql();
      final result = await dataSource.getName(usuario);

      if (user != null && result != null) {
        print('trajo datos');
        print(result);
        emit(AuthSignedWithMysql(user));
      } else if (user != null && result == null) {
        emit(AuthNoRegister(user));
      } else if (user == null) {
        emit(AuthSignedOut());
      }
    } on Exception catch (_) {
      print("Se cayo");
    }
  }

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      emit(AuthSigningIn());
      final user = await auxUser;
      if (user == null) {
        emit(AuthError("Unknown error, try again later"));
      } else {
        emit(AuthSignedWithMysql(user));
      }
    } catch (e) {
      emit(AuthError("Error ${e.toString()}"));
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(AuthSignedOut());
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthSignedOut extends AuthState {}

class AuthSigningIn extends AuthState {}

class AuthSignedIn extends AuthState {
  final AuthUser user;

  AuthSignedIn(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthSignedWithMysql extends AuthState {
  final AuthUser user;

  AuthSignedWithMysql(this.user);
  @override
  List<Object?> get props => [user];
}

class AuthNoRegister extends AuthState {
  final AuthUser user;

  AuthNoRegister(this.user);
  @override
  List<Object?> get props => [user];
}
