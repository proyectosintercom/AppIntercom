import 'dart:async';
import 'dart:html';

import 'package:appintercom/src/models/user_chatbot_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_source/rest_data_source_chatbot.dart';
import '../../repository/user_chatbot_repository.dart';

part 'contract_state.dart';


class ContractCubit extends Cubit<ContractState> {
  final ContractRepositoryBase _contractRepository;
  late StreamSubscription _contractSubscription;

  ContractCubit(this._contractRepository) : super(ContractInitial());

  Future<void> init() async {
    // Just for testing. Allows the splash screen to be shown a few seconds
    await Future.delayed(const Duration(seconds: 0));
    _contractSubscription =
        _contractRepository.onAuthStateChanged.listen(_contracStateChanged);
  }

  Future<void> _contractStateChanged(UserChatRepo? documento) async {
    try {
      if (documento == null) {
        return emit(WithoutContract());
      } else {
        final dataSource = RestDataChatbot();
        final usuario = await dataSource.getDataPS(documento.documento);
        print("Ingreso por este estado de contrato");
        //   print(usuario.cedula);
        if (usuario == null) {
          emit(AuthNoRegister(user));
        } else {
          emit(AuthSignedWithMysql(user));
        }
      }
    } on Exception catch (e) {
      print("No trajo datos");
      //emit(AuthNoRegister(user));

    }
  }

}
