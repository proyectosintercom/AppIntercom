import 'package:appintercom/src/bloc/auth_cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const IntroScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: const Text('Welcome'),
          ),
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget {
  final String exampleText =
      'Lorem ipsum dolor sit amet, consecrated advising elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.';

  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;

    return AbsorbPointer(
      absorbing: isSigningIn,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        length: 2,
        indicatorSpace: 12,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Colors.black,
        child: PageView(
          controller: usePageController(),
          children: const <Widget>[
            _DescriptionPage(
              text:
                  'Puedes solicitar asistencia o reportar algún incidente a nuestro call center 0986518050',
              imagePath: 'assets/intro/intro1.png',
            ),
            _DescriptionPage(
              text:
                  'Ahora puedes pagar desde la comodidad de tu hogar o hacerlo en cualquiera de nuestra red activa',
              imagePath: 'assets/intro/intro2.png',
            ),
          ],
        ),
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;

  const _DescriptionPage({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
