import 'package:appintercom/src/models/user_finansys_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appintercom/src/repository/bloc/auth_cubit.dart';
import 'package:appintercom/src/data_source/rest_data_source.dart';

class HomeScreen extends StatelessWidget {
  static Widget create(BuildContext context) => HomeScreen();

  const HomeScreen({Key? key}) : super(key: key);
  Future<UserFinansys> datos() async {
    final dataSource = RestDataSource();
    final name = await dataSource.getName("0190483843001", "5600000038");

    return name;
  }

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

                     Card(
                      child: Column(

                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          FutureBuilder<UserFinansys>(
                            future: datos(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return  ListTile(
                                  leading: Icon(Icons.album),
                                  title: Text(snapshot.data!.nombre),
                                  subtitle: Text(snapshot.data!.cedula),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              // Por defecto, muestra un loading spinner
                              return CircularProgressIndicator();
                            },
                          ),





                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('BUY TICKETS'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('LISTEN'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),



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
