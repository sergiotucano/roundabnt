
import 'package:roundabnt/roundabnt.dart';

class RoundAbnt implements RoundAbntImplementation {

  @override
  /*
  * Regra ABNT :
  *  Se o proximo número do último algarismo a ser conservado for menor que 5 :
  *  manter-se-a o último algarismo a ser conservado.
  *
  *  Caso seja superior a 5 :
  *  aumentará 1 no algarismo a ser mantido.
  *
  *  Se o proximo número do último algarismo a ser conservado for igual a 5 :
  *  Caso o algarismo a ser conservado for impar
  *  aumentará 1 no algarismo a ser mantido.
  *  Caso o algarismo a ser conservado for par
  *  se tiver algum algarismo zero depois do algarismo, se mantem o algarismo
  *  caso contrário soma-se 1.
  *
  *  https://www.sofazquemsabe.com/2011/01/como-fazer-arredondamento-da-numeracao.html
  * */

  double roundAbnt(String aValue, int digits) {

    bool negative;
    double value = double.parse(aValue);
    String newValue = '';
    String intPart = '0';
    String fractPart = '0';
    String truncDigit = '0';
    String restDigit = '0';
    String restAllDigits = '0';
    String mantainDigit = '0';
    int restValue = 0;
    double resultValue = 0.00;

    negative = value < 0;

    newValue = '';
    intPart = aValue.substring(0, aValue.indexOf('.'));
    fractPart = aValue.substring(aValue.indexOf('.')+1);

    try {
      truncDigit = fractPart.substring(0, digits);
    } catch(_){
      truncDigit = fractPart.substring(0);
      truncDigit = truncDigit + '0' * (digits - truncDigit.toString().length);
    }

    try {
      restDigit = fractPart.substring(digits, digits + 1);
    } catch(_){
      restDigit = '0';
    }

    try {
      restAllDigits = fractPart.substring(digits);
    } catch(_){
      restAllDigits = '0';
    }

    try {
      mantainDigit = fractPart.substring(1, digits);
    }catch(_){
      mantainDigit = fractPart.substring(0);
    }

    restValue = int.parse(restDigit);
    resultValue = 0.00;

    if (restValue < 5){
      newValue = '$intPart.$truncDigit';
      resultValue = double.parse(newValue);
    } else if (restValue > 5){
      int addDigit = int.parse(truncDigit) + 1;

      if (addDigit == 0){
        intPart = '${int.parse(intPart)+1}';
      }

      newValue = '$intPart.$addDigit';
      resultValue = double.parse(newValue);
    } else if (restValue == 5){
      int matainValue = int.parse(mantainDigit);
      if ((matainValue % 2) != 0) {
        int addDigit = int.parse(truncDigit) + 1;

        if (addDigit == 0){
          intPart = '${int.parse(intPart)+1}';
        }

        newValue = '$intPart.$addDigit';
        resultValue = double.parse(newValue);
      } else {
        if (restAllDigits.contains('0')){
          int addDigit = int.parse(truncDigit);
          newValue = '$intPart.$addDigit';
          resultValue = double.parse(newValue);
        } else {
          int addDigit = int.parse(truncDigit) + 1;

          if (addDigit == 0){
            intPart = '${int.parse(intPart)+1}';
          }

          newValue = '$intPart.$addDigit';
          resultValue = double.parse(newValue);
        }
      }
    }

    if (negative){
      return -1.0 * resultValue;
    }
    return resultValue;
  }



}

