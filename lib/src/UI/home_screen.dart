import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appintercom/src/repository/bloc/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
  static Widget create(BuildContext context) => HomeScreen();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Bienvenido')),
        body: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) => current is AuthSignedIn,
            builder: (_, state) {
              final authUser = (state as AuthSignedIn).user;
              return Center(
                child: Column(
                  children: [
                    Text('Usuario: ${authUser.uid}'),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () => context.read<AuthCubit>().signOut(),
                        child: Text('Salir'))
                  ],
                ),
              );
            }));
  }
}
