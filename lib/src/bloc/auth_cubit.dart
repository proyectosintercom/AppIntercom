import 'package:appintercom/src/repository/auth_repository.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_source/rest_data_mysql.dart';
import '../models/user_mysql_model.dart';

Future<UserMysql> datosMysql(user) async {
  final dataSource = RestDataSourceMySql();
  final user1 = await dataSource.getName(user);
  //print(user.correo);
  print(user1.cedula);
  return user1;
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;

  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async {
    // Just for testing. Allows the splash screen to be shown a few seconds
    await Future.delayed(const Duration(seconds: 3));
    _authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  Future<void> reset() async => emit(AuthInitialState());

  void _authStateChanged(AuthUser? user) {
    if (user != null) {
      datosMysql(user);
      //emit(AuthSignedOut());
    } else {
      emit(AuthSignedOut());
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
