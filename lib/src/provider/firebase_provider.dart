import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appintercom/src/models/user.dart';
import 'package:path/path.dart' as path;

class FirebaseProvider {
  User get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Not authenticated exception');
    return user;
  }

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FirebaseStorage get storage => FirebaseStorage.instance;

  Future<UserIntercom?> getMyUser() async {
    final snapshot = await firestore.doc('user/${currentUser.uid}').get();
    if (snapshot.exists) return UserIntercom.fromFirebaseMap(snapshot.data()!);
    return null;
  }

  Future<void> saveMyUser(UserIntercom user, File? image) async {
    final ref = firestore.doc('user/${currentUser.uid}');
    if (image != null) {
      final imagePath = '${currentUser.uid}/profile/${path.basename(image.path)}';
      final storageRef = storage.ref(imagePath);
      await storageRef.putFile(image);
      final url = await storageRef.getDownloadURL();
      await ref.set(user.toFirebaseMap(newImage: url), SetOptions(merge: true));
    } else {
      await ref.set(user.toFirebaseMap(), SetOptions(merge: true));
    }
  }
}