import 'package:appintercom/src/repository/implementations/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appintercom/src/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/bloc/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authCubit = AuthCubit(AuthRepository());
  runApp(BlocProvider(
    create: (_) => authCubit..init(),
    child: MyApp.create(),
  ));
}