import 'package:flutter/material.dart';
import 'package:appintercom/src/UI/theme/colors/ligth_colors.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const TopContainer( {required this.height,required this.width,required this.child});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
     EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
          color: LightColors.kDarkYellow,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
