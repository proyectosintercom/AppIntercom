import 'package:equatable/equatable.dart';

class UserChatRepo extends Equatable {
  final String key;
  final String documento;

  const UserChatRepo(this.key,this.documento);
  @override
  // TODO: implement props
  List<Object?> get props => [key];
}

abstract class ContractRepositoryBase {
  Stream<UserChatRepo?> get onAuthStateChanged;
  Future<void> signOut();
}
