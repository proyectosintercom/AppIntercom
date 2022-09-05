import 'package:equatable/equatable.dart';
class AuthUser extends Equatable
{
  final String uid;

  const AuthUser(this.uid);
  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}

abstract class AuthRepositoryBase
{
  Stream<AuthUser?> get onAuthStateChanged;

  Future<AuthUser?> signInWithEmailAndPassword(String email,String password);
  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password);
  Future<AuthUser?> signInWithGoogle();
  Future<void> signOut();



}
