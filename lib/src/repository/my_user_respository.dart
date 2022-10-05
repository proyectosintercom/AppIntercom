import 'dart:io';

import 'package:appintercom/src/models/user.dart';

abstract class MyUserRepositoryBase {
  Future<UserIntercom?> getMyUser();

  Future<void> saveMyUser(UserIntercom user, File? image);
}