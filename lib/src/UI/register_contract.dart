import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';
import '../data_source/rest_data_source_chatbot.dart';
import '../models/user_chatbot_model.dart';
import '../models/user_finansys_model.dart';
import '../data_source/rest_data_source.dart';

class register_contract extends StatefulWidget {
  static Widget create(BuildContext context) => const register_contract();

  const register_contract({super.key});

  @override
  State<register_contract> createState() => _register_contractState();
}

class _register_contractState extends State<register_contract> {
  @override
  final txtcedula = TextEditingController();
  String cedula='';

  Widget build(BuildContext context) {

    Future<Userchatbot?> getDataPS(cedula) async
    {
      try {
        final dataSource = RestDataChatbot();
        final name = await dataSource.getDataPS(cedula);
        print(name);
        return name;
      }
      catch (e)
      {
        print(e);
      }

    }

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(title: const Text('Bienvenido')),
        body: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) => current is AuthNoRegister,
            builder: (_, state) {
              final authUser = (state as AuthNoRegister).user;
              return Center(
                child: Column(
                  children: [
                    Text('Usuario: ${authUser.uid}'),
                    const SizedBox(
                      height: 16,
                    ),

                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: txtcedula,
                            validator: (String? value)
                            {
                              if (value!.isEmpty) {
                                return 'Por favor ingrese número de cédula';
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                cedula=txtcedula.text;
                               getDataPS(cedula);

                                FutureBuilder<Userchatbot?>(
                                    future: getDataPS(cedula),
                                    builder: (BuildContext context,snapshot) {
                                      if (snapshot.hasData) {
                                        return Text("Hoooooola${snapshot.data!.unidad}");
                                      }
                                      else if(!snapshot.hasData)
                                        {
                                          return Text("NO tiene datos");
                                        }

                                     else {
                                        return CircularProgressIndicator();
                                      }
                                    });


                                /*
                                FutureBuilder<UserFinansys?>(

                                    future: getContract(cedula),

                                    builder: (BuildContext context,snapshot) {
                                      if (snapshot.hasData)
                                      {
                                        return Text("TRajo los datos ");
                                      } else if(!snapshot.hasData)


                                        {
                                         return(AlertDialog(title: const Text("Mensaje del Sistema"),content: const Text("Usuario no existe"),));
                                        }
                                      else if(context==null)
                                        {
                                          return(Text("Hoooo"));

                                        }


                                      else if (snapshot.hasError)
                                      {
                                        return Icon(Icons.error_outline);
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    });

*/



                                // devolverá true si el formulario es válido, o falso si
                                // el formulario no es válido.
                                if (_formKey.currentState!.validate())
                                {
                                  // Si el formulario es válido, queremos mostrar un Snackbar
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ),





                    ElevatedButton(
                        onPressed: () => context.read<AuthCubit>().signOut(),
                        child: const Text('Salir'))
                  ],
                ),
              );
            }));
  }
}

