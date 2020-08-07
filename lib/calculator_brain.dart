import 'dart:math';


class CalculatorBrain{

CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){

     _bmi = weight/ pow(height/100 , 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi >= 25){
      return 'overweight';
    }
    else if(_bmi >= 18.5 && _bmi < 25){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'take a little less food and more exercise';
    }
    else if(_bmi >= 18.5 && _bmi < 25){
      return 'keep it up keep inspiring share your exercise routine and diet plan with people';
    }
    else{
      return 'stay hungry and grab much food as possible get some weight and good exercise and sleep';
    }
  }
}