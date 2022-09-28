
import 'package:appintercom/src/UI/Animation/FadeAnimation.dart';
import 'package:appintercom/src/repository/bloc/auth_cubit.dart';
import 'package:appintercom/src/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appintercom/src/repository/bloc/auth_cubit.dart';

import 'package:animate_do/animate_do.dart';
class PaginaLogin extends StatefulWidget{
  const PaginaLogin({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const PaginaLogin();



  @override
  PaginaLoginState createState() => PaginaLoginState();
}

class PaginaLoginState extends State<PaginaLogin> {
  @override
  Widget build(BuildContext context) {
    const colorI = const Color(0xFF59256c);
    const colorAzul = const Color(0xFF3CA8E0);
    const colorAmarillo= const Color(0xFFFDBB4A);

    return Scaffold(
        appBar: AppBar(
        title: const Text('Bienvenido')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  colorAzul,
                  colorAzul,
                  colorAzul
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInDown(child:Text("Intercom", style: TextStyle(color: Colors.white, fontSize: 40),),),
                  SizedBox(height: 10,),

                 // FadeInDown(child: Text("Bienvenido", style: TextStyle(color: Colors.white, fontSize: 18),),),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                          FadeInDown(child:Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Correo electrónico",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              )),
                  FadeInDown(child:
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),),
                            ],
                          ),
                        ),

                        // Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 20,),
                    FadeInDown(child:
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: colorAzul
                          ),
                          child: _Botones(
                            text:"Login",
                          color: colorAzul,
                            onTap: () =>
                                Navigator.popAndPushNamed(context, Routes.crear),
                          ),
                        ),),
                        SizedBox(height: 20,),
                        FadeInDown(child:
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              //color: colorAmarillo
                          ),

                          child: Center(
                            child:  _Botones(
                              text:"Registrarse",
                              color: colorAmarillo,
                              onTap: () =>
                                  Navigator.popAndPushNamed(context, Routes.crear),
                            ),

                          ),
                        ),),
                        SizedBox(height: 20,),
                        FadeInDown(child:Text("Inicio rápido", style: TextStyle(color: Colors.grey),),),
                        SizedBox(height: 20,),
                    FadeInDown(child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[


                            Expanded(


                              child: Center(
                                child:CircleAvatar(radius: (30),
                                    backgroundColor: Colors.white24,
                                    child: GestureDetector(
                                      onTap: ()=>context.read<AuthCubit>().signInWithGoogle(),
                                        child: ClipRRect(
                                          borderRadius:BorderRadius.circular(20),
                                          child: Image.asset("assets/redes/googlecircular.png"),
                                        )

                                    ),


                                ),
                              ),
                            ),

                            SizedBox(width: 30,),

                          ],
                        ),),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;

  const _LoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
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
              fixedSize: MaterialStateProperty.all(const Size(300,80)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),



    );

  }
}