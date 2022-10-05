part of 'user_super_bloc.dart';

abstract class UserSuperEvent extends Equatable {
  const UserSuperEvent();

  @override
  List<Object> get props => [];
}

class VerifyUserMysql extends UserSuperEvent {}
