import 'package:bmi_calculator/results_page.dart';
import 'calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'roundIconButton.dart';


enum Gender{
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height= 180;
  int weight = 60;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard( 
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour:selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                ),),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                colour:selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor, 
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),

                ),
                ),
            ],
          )),
          Expanded(
            child: ReusableCard(colour:kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Height', style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style:kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEA1556),
                      overlayColor: Color(0x29EA1556),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                    ),
                    child: Slider(
                    value: height.toDouble(), 
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });                   
                    },
                    ),
                )
              ],
            ),),),
          Expanded(
            child:Row(
            children: <Widget>[
              Expanded(
                child:ReusableCard(
                  colour:kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kLabelTextStyle,),
                      Text(weight.toString(),
                      style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           RoundIconButton(icon: FontAwesomeIcons.minus,
                           onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },),
                  
                        ],
                      )
                      
                    ],
                  ),
                  )),
              Expanded(
                child: ReusableCard(
                  colour:kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: kLabelTextStyle,),
                      Text(age.toString(),
                      style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           RoundIconButton(icon: FontAwesomeIcons.minus,
                           onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                  
                        ],
                      )
                      
                    ],
                  ),),
                  ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
             onTap: (){

               CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);


               Navigator.push(
                 context, MaterialPageRoute(builder: (context)=>ResultPage(

                   bmiResult: calc.calculateBMI(),
                   resultText: calc.getResults(),
                   interpretation: calc.getInterpretation(),
                 ),),
               );
             },),
        ],
        
      )
     
    );
  }
}


 

 // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = activeCardColor;

  // void updateColor(Gender selectedGender){
  //   if(selectedGender == Gender.male){
  //     if(maleCardColor==inactiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else{
  //       maleCardColor = inactiveCardColor;
        
  //     }
  //   }
  //   if(selectedGender==Gender.female){
  //     if(femaleCardColor==inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else{
  //       femaleCardColor = inactiveCardColor;
        
  //     }
  //   }
  // }

 