
import 'package:appintercom/src/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends AuthRepositoryBase
{
  final _firebaseAuth = FirebaseAuth.instance;
  AuthUser? _userFromFirebase(User? user) => user == null ? null : AuthUser(user.uid);

  @override
  Stream<AuthUser?> get onAuthStateChanged => _firebaseAuth.authStateChanges().asyncMap(_userFromFirebase);

  /*@override
  Future<AuthUser?> signInAnonymously() async {
    try {
      final user = await _firebaseAuth.signInAnonymously();
      print(user);
      return _userFromFirebase(user.user);
    } on Exception catch (e) {
      print(e);
    }
  }*/

   /* @override
    Future<AuthUser?> signInWithGoogle() async {
      try {

        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();



        final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;



        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
        return _userFromFirebase(authResult.user);



      } on Exception catch (e) {
        print(e);
      }
    }

    @override
    Future<AuthUser?> createUserWithEmailAndPassword(
        String email, String password) async {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(authResult.user);
    }

    @override
    Future<AuthUser?> signInWithEmailAndPassword(
        String email, String password) async {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(authResult.user);
    }
*/
    @override
    Future<void> signOut() async {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      await _firebaseAuth.signOut();
    }


}