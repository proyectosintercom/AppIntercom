import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appintercom/src/UI/widget/top_container.dart';
import 'package:appintercom/src/UI/theme/colors/ligth_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoCliente extends StatelessWidget
{
  String username = "Carl Michael";
  String welcome = "Welcome Back!";
  String value = "1465";
  final controller = ScrollController();

  bool isgoodornot = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return SafeArea( child:Column(children: [
      TopContainer(
        height: 250,
        width: width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu,
                      color: LightColors.kDarkBlue, size: 30.0),
                  Icon(Icons.search,
                      color: LightColors.kDarkBlue, size: 25.0),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 5.0,
                      animation: true,
                      percent: 0.75,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: LightColors.kRed,
                      backgroundColor: LightColors.kDarkYellow,
                      center: CircleAvatar(
                        backgroundColor: LightColors.kBlue,
                        radius: 35.0,
                        backgroundImage: AssetImage(
                          'assets/avatar.png',
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Sourav Suman',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 22.0,
                              color: LightColors.kDarkBlue,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'App Developer',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),


    ],));


  }
}