import 'package:appintercom/src/models/user_finansys_model.dart';
import 'package:appintercom/src/models/user_mysql_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appintercom/src/bloc/auth_cubit.dart';
import 'package:appintercom/src/data_source/rest_data_source.dart';
import 'package:appintercom/src/data_source/rest_data_mysql.dart';


Future<UserFinansys?> SaldoFinansys (company,contrato) async {
  final dataSource = RestDataSource();
  final name = await dataSource.getSaldo(company, contrato);
  print(name);
  return name;
}
Future<UserMysql?> datosMysql(usuario) async {
  try {
    final dataSource = RestDataSourceMySql();
    final user = await dataSource.getName(usuario);
    return user;
  }
  catch (e){print('Problemas');};
}

class HomeScreen extends StatelessWidget {
  static Widget create(BuildContext context) => const HomeScreen();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    getCurrentUser() async {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          print("Aqui esta${user.uid}");

        }
      });
    }

    String usuario = "s";

    var eluser = getCurrentUser();

    return Scaffold(
        drawer: Drawer(
            child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(20),
                child: const Image(
                  image: AssetImage('assets/avatar.png'),
                ),
              ),
              const Text("tt"),


            ],
          ),
        )),
        appBar: AppBar(title: const Text('Bienvenido')),
        body: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current) => current is AuthSignedWithMysql,
            builder: (_, state) {
              final authUser = (state as AuthSignedWithMysql).user;
              usuario = authUser.uid;

              return (Column(
                children: [
                  FutureBuilder<UserMysql?>(
                      future: datosMysql(usuario),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {

                          print (snapshot.data!.cedula);
                          var nombres=snapshot.data!.nombres;
                          var direccion=snapshot.data!.direccion;
                          var direccion1=snapshot.data!.direccion1;
                          var plan=snapshot.data!.plan;
                          var contrato=snapshot.data!.idc;
                          var company= snapshot.data!.id_company;

                          return Column(children: [


                            Datos(nombres),
                            CardDireccion(direccion,direccion1),
                            cardplan(plan),
                            saldo(company,contrato)
                          ],);
                        } else
                        {
                          return const CircularProgressIndicator();
                        }
                      }),



                  ElevatedButton(
                      onPressed: () => context.read<AuthCubit>().signOut(),
                      child: const Text('Salir'))
                ],
              ));
            }));
  }
}

Card CardDireccion(String direccion,String direccion1) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(direccion,style: const TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
          subtitle: Text(direccion1),
          leading: Icon(Icons.fmd_good_rounded),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

          ],
        )
      ],
    ),
  );
}

Container Datos(String nombres)
{
  return Container(
      padding: const EdgeInsets.all( 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    const         Text(
              "Hola,",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              nombres,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
        const CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage("assets/icon-user.png"),
        )
      ],
    )
  );
}

Container Direccion()
{
  return      Container(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 35.0),
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 200, 228),
        borderRadius: BorderRadius.circular(35.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/wifi.png",
          width: 90,
          height: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How do you feel?",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              width: 120,
              child: Text(
                "Fill out your medical right now",
                style: TextStyle(color: Colors.black87, fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                width: 150,
                height: 35,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12.0)),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );


}

Card cardplan(String plan) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text("Tu PLAN ACTUAL:",style: const TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
          subtitle: Text(plan),
          leading: Icon(Icons.fmd_good_rounded),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

          ],
        )
      ],
    ),
  );
}

Card saldo(company, contrato){

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[



  FutureBuilder<UserFinansys?>(
            future:  SaldoFinansys(company,contrato),
            builder: (BuildContext context, snapshot)
            {
              if (snapshot.hasData) {
               return ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
                  title: Text("Tu deuda es:",style: const TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                  subtitle: Text("\$ ${snapshot.data!.total}"),
                  leading: Icon(Icons.monetization_on_rounded),
                );
              }
              else if(!snapshot.hasData)
                {
                 return const ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text("No tienes saldo pendiente:",style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                    subtitle: Text("0.0"),
                    leading: Icon(Icons.fmd_good_rounded),
                  );

                }
              else if (snapshot.hasError)
              {
                return Icon(Icons.error_outline);
              } else
              {
                return CircularProgressIndicator();
              }
            })

,


        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

          ],
        )
      ],
    ),
  );
}