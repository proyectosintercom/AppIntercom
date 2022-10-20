import 'package:flutter/cupertino.dart';
import 'package:appintercom/src/UI/widget/active_services.dart';
import 'package:appintercom/src/UI/theme/colors/ligth_colors.dart';

class services extends StatelessWidget
{
  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Expanded(
        child: SingleChildScrollView(
        child: Column(
        children: <Widget>[



      Container(

      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          subheading('Active Projects'),
          const SizedBox(height: 5.0),
          Row(
            children: const <Widget>[
              ActiveProjectsCard(
                cardColor: LightColors.kGreen,
                loadingPercent: 0.25,
                title: 'Medical App',
                subtitle: '9 hours progress',
              ),
              SizedBox(width: 20.0),
              ActiveProjectsCard(
                cardColor: LightColors.kRed,
                loadingPercent: 0.6,
                title: 'Making History Notes',
                subtitle: '20 hours progress',
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              ActiveProjectsCard(
                cardColor: LightColors.kDarkYellow,
                loadingPercent: 0.45,
                title: 'Sports App',
                subtitle: '5 hours progress',
              ),
              SizedBox(width: 20.0),
              ActiveProjectsCard(
                cardColor: LightColors.kBlue,
                loadingPercent: 0.9,
                title: 'Online Flutter Course',
                subtitle: '23 hours progress',
              ),
            ],
          ),
        ],
      ),
    )]
        )
        )
    );


  }
}