part of 'contract_cubit.dart';


abstract class ContractState extends Equatable {
  @override
  List<Object> get props => [];
}

class ContractInitial extends ContractState {}

class ContractIn extends ContractState
{
  final UserChatRepo contract;
  ContractIn(this.contract);
  @override
  List<Object?> get props => [contract];
}

class WithoutContract extends ContractState
{

}
