import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Your Result',
            style: kTitleTextStyle,
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActivecolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('NORMAL',
                  style: kResultTextStyle,),
                  Text(
                    '18.3',
                    style: kBMITextStyle,
                  ),
                  Text('your bmi is quite low',style: kBodyTextStyle,
                  textAlign: TextAlign.center,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
