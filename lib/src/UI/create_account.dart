import 'package:flutter/material.dart';
import 'package:appintercom/src/bloc/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
class Createaccount extends StatefulWidget {
  const Createaccount({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => const Createaccount();

  @override
  CreateaccountState createState() => CreateaccountState();


}



class CreateaccountState extends State<Createaccount> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  customDialog(BuildContext context, Widget child,
      {double dialogHeight = 400, double dialogWidth = 200}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Mensaje del Sistema"),
          content: child,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }



  @override
  Widget build(BuildContext context) {

    const colorI = const Color(0xFF59256c);
    const colorAzul = const Color(0xFF3CA8E0);
    const colorAmarillo= const Color(0xFFFDBB4A);
    const colorRojo= const Color(0xFFF16956);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
        Container(
                  height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [
              colorAmarillo,
              colorAzul,
              colorRojo,
              ])),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 80, bottom: 30, right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Regístrate',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Bienvenido',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    )),


                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(top: 80, right: 15, left: 15),
                    child: Column(
                      children: [

                        Container(
                          height: 250,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                      offset: const Offset(0, 10))
                                ]),
                          child: Column(
                            children: [


    BlocConsumer<AuthCubit, AuthState>(
    listener:(_,state) {
      if(state is AuthError){
    customDialog(context,Text(
    state.message,
    style: const TextStyle(color: Colors.red, fontSize: 24),
    ),);

    }
    },
    builder: (_, state){
      return Form(key: _formKey, child:

      Padding(

    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    if (state is AuthSigningIn)
    const Center(child: CircularProgressIndicator()),


    const SizedBox(height: 8),
    TextField(
    controller: _emailController,
    decoration: const InputDecoration(labelText: 'Email'),


    ),
      const SizedBox(height: 8),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(labelText: 'Contraseña'),
        obscureText: true,
        obscuringCharacter: "*",

      ),


    ]

    ))




      );
    }
    )








                            ],
                          ),
                        )



                        ,const SizedBox(height: 30),

                        /// Sign Up
                        Container(
                        child: _Botones(
                          text: "Registrar",
                          color: colorAmarillo,
                          onTap: (){ context.read<AuthCubit>().createUserWithEmailAndPassword(_emailController.text, _passwordController.text,);},
                        ),
                      ),
                      const SizedBox(height: 30),

                        /// SNS
                        Text('Inicio Rápido',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 30),

                        /// Facebook/Google/Apple
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            MaterialButton(
                              shape: const StadiumBorder(),
                              minWidth: 110,
                              height: 45,
                              color: const Color(0xffe15241),
                              child: const Text(
                                'Google',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: ()=>context.read<AuthCubit>().signInWithGoogle(),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),

        ])
        )
    );

  }


}



class _Botones extends StatelessWidget
{
  final String text;
  final Color color;
  final VoidCallback? onTap;




  const  _Botones({
    Key? key,
    required this.text,
    required this.color,
    this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: onTap,
        child: Text(text, style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20) ,),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            fixedSize: MaterialStateProperty.all(const Size(400,50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),



      );

  }
}
*/