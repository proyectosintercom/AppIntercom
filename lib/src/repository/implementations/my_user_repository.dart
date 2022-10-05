import 'dart:io';

import 'package:appintercom/src/models/user.dart';
import 'package:appintercom/src/provider/firebase_provider.dart';


import '../my_user_respository.dart';

class MyUserRepository extends MyUserRepositoryBase {
  final provider = FirebaseProvider();

  @override
  Future<UserIntercom?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(UserIntercom user, File? image) => provider.saveMyUser(user, image);
}