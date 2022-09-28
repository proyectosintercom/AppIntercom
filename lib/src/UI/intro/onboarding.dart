import 'dart:ui';
import 'package:appintercom/src/UI/intro/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:appintercom/src/navigation/routes.dart';
class OnBoardingAnimationExample extends StatefulWidget {

  static Widget create(BuildContext context) => OnBoardingAnimationExample();



  const OnBoardingAnimationExample({Key? key}) : super(key: key);

  @override
  State<OnBoardingAnimationExample> createState() =>
      _OnBoardingAnimationExampleState();
}

class _OnBoardingAnimationExampleState
    extends State<OnBoardingAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: OnBoardingAnimation(
          pages: [
            _GetCardsContent(
              image: 'assets/intro/intro1.png',
              cardContent:
              'Ahora con nuestro call center puedes solicitar ayuda 24/7 y obtener un tiempo de respuesta muy reducido',
            ),



            _GetCardsContent(
              image: 'assets/intro/intro2.png',
              cardContent:
              'Puedes realizar los pagos en línea o utilizar nuestro canales disponibles.',

            ),

          ],

          indicatorDotHeight: 7.0,
          indicatorDotWidth: 7.0,
          indicatorType: IndicatorType.expandingDots,
          indicatorPosition: IndicatorPosition.bottomCenter,
        ),



      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {

  final String image, cardContent;

  const _GetCardsContent({
    Key? key,
    this.image = '',
    this.cardContent = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(50.0),
              ),
              child: Image.asset(image),
            ),
            Text(
              cardContent,
              style: GoogleFonts.abel(fontSize: 25.0),
            ),





            _LoginButton(text: "Empecemos",onTap: ()=> Navigator.popAndPushNamed(context, Routes.login),),

            ],

        ),


      ),




    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;

  const _LoginButton({
    Key? key,
    required this.text,
    //const colorAzul = const Color(0xFF3CA8E0);
    this.onTap,
    this.color = const Color(0xFFFDBB4A),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
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




