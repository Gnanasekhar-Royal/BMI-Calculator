
import 'dart:math';

class Calculatebmi{
  final int height;
  final int weight;
  double bmi;

  Calculatebmi({this.weight=0,this.height=0,this.bmi=0});

  String calculatebmi(){
    bmi=weight/pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getresult(){
    if(bmi>=25){
      return 'Overweight';
    }else if(bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String feedback(){
    if(bmi>=25){
      return 'you have heigher then normal body weight.\ntry to more exerices.Those who are overwieght(BMI 25 to 29.9).it is recommanded that you lose weight';
    }else if(bmi>18.5){
      return 'You have normal body weight. Congratulation';
    }else{
      return 'Eat more frequently. you are underweight.\nEat may you fell full faster';
    }
  }



}