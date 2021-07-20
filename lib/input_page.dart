import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card.dart';
import 'constants.dart';
import 'result_page.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selected;
  int height=180;
  int weight=72;
  int age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:  ReusableCard(
                    onPress: (){
                      setState(() {
                        selected=Gender.male;
                      });
                    },
                    colour: selected==Gender.male?kActivecolour:kInactivecolour,
                    cardChild:  GenderCard(genderIcon:
                      FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selected=Gender.female;
                      });
                    },
                    cardChild: GenderCard(gender: 'FEMALE', genderIcon: FontAwesomeIcons.venus,
                    ),
                    colour: selected==Gender.female?kActivecolour:kInactivecolour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: kActivecolour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Height",
                style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),
                      style:kNumberTextStyle
                    ),
                    Text("cm",
                    style: kLabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0
                    ),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    max: 220.0,
                    min: 120.0,
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                  ),
                )

              ],
            ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kActivecolour,
                  cardChild: Column(
                    children: <Widget>[
                      Text('Weight',
                      style: kLabelTextStyle,),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(child: FontAwesomeIcons.minus,onPressed:(){
                           setState(() {
                             weight--;
                           });
                          },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(child: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          ),
                        ],
                      ),

                    ],
                  ),),
                ),
                Expanded(
                  child: ReusableCard(colour: kActivecolour,
                  cardChild: Column(
                    children: <Widget>[
                      Text("Age",style: kLabelTextStyle,),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(child: FontAwesomeIcons.minus,onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(child:FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          ),
                        ],
                      )
                    ],
                  ),),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return ResultPage();
              }));
            },
            child: Container(
              child: Center(
                child: Text('Calculate',
                style: kLargeTextStyle,),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHieght,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.child,this.onPressed});
  final IconData child;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      elevation: 6.0,
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}


