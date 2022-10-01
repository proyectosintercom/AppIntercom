import 'package:appintercom/src/models/user_finansys_model.dart';
import 'package:appintercom/src/models/user_mysql_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appintercom/src/repository/bloc/auth_cubit.dart';
import 'package:appintercom/src/data_source/rest_data_source.dart';
import 'package:appintercom/src/data_source/rest_data_mysql.dart';

import 'componentes/info_cliente.dart';
import 'componentes/services.dart';


Future<UserFinansys> datosFinansys() async{
  final dataSource = RestDataSource();
  final name = await dataSource.getName("0190483843001", "5600000038");
  return name;
}
Future<UserMysql> datosMysql(usuario) async{
  final dataSource = RestDataSourceMySql();
  final user = await dataSource.getName(usuario);
  //print(user.correo);
  print(user.cedula);
  return user;
}
class HomeScreen extends StatelessWidget {
  static Widget create(BuildContext context) => HomeScreen();

  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String usuario="s";





    return Scaffold(
        appBar: AppBar(title: Text('Bienvenido')),
        body: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) => current is AuthSignedIn,
            builder: (_, state) {
              final authUser = (state as AuthSignedIn).user;
              usuario=authUser.uid;

              return (Column(children: [
                ElevatedButton(
                    onPressed: () => context.read<AuthCubit>().signOut(),
                    child: Text('Salir'))
              ],));

              /*return FutureBuilder<UserMysql>(
                future: datosMysql(usuario),
                  builder: (_,snapshot)
                  {
                    if(snapshot.hasData)
                      {
                        return (Column(children: [
                          Text("Usuario con mysql"),
                          ElevatedButton(
                              onPressed: () => context.read<AuthCubit>().signOut(),
                              child: Text('Salir'))
                        ],));
                      }
                    else {
                      return Column(
                        children: [
                          Text('Usuario no tiene registrado su contrato'),
                          ElevatedButton(
                              onPressed: () => context.read<AuthCubit>().signOut(),
                              child: Text('Salir'))

                        ],
                      );
                    }

                  }
              );

            */

            })
    );







   /* Scaffold(
        appBar: AppBar(title: Text('Bienvenido')),
        body: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) => current is AuthSignedIn,
            builder: (_, state) {
              final authUser = (state as AuthSignedIn).user;
              usuario=authUser.uid;

              return Center(
                child: Column(
                  children: [
                    Text('Usuario: ${authUser.uid}'),


                    Card(
                      child: Column(

                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          FutureBuilder<UserMysql>(
                            future: datosMysql(usuario),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListTile(
                                  leading: Icon(Icons.album),
                                  title: Text(snapshot.data!.correo),
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
                                onPressed: () {
                                  /* ... */
                                },
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('LISTEN'),
                                onPressed: () {
                                  /* ... */
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),




                    Card(
                      child: Column(

                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          FutureBuilder<UserFinansys>(
                            future: datosFinansys(),
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
            })
    );

 */





  }
}
