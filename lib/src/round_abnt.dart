import 'package:roundabnt/round_abnt.dart';

/// Regra ABNT :
///  Se o proximo número do último algarismo a ser conservado for menor que 5 :
///  manter-se-a o último algarismo a ser conservado.
///
///  Caso seja superior a 5 :
///  aumentará 1 no algarismo a ser mantido.
///
///  Se o proximo número do último algarismo a ser conservado for igual a 5 :
///  Caso o algarismo a ser conservado for impar
///  aumentará 1 no algarismo a ser mantido.
///  Caso o algarismo a ser conservado for par
///  se tiver algum algarismo zero depois do algarismo, se mantem o algarismo
///  caso contrário soma-se 1.
///
///  https://www.sofazquemsabe.com/2011/01/como-fazer-arredondamento-da-numeracao.html

class RoundAbnt implements RoundAbntImplementation {
  //calc rounded number with brazilian abnt rule
  @override
  double roundAbnt(String aValue, int digits) {
    String newValue = '';
    String intPart = '0';
    String fractPart = '0';
    String truncDigit = '0';
    String restDigit = '0';
    String mantainDigit = '0';
    int restValue = 0;
    double resultValue = 0.00;

    newValue = '';

    try {
      ///Verify int part. if haven't dot return int part with zero in fract
      try {
        intPart = aValue.substring(0, aValue.indexOf('.'));
      } catch (_) {
        intPart = aValue;
        truncDigit = '0';
        truncDigit = truncDigit + '0' * (digits - truncDigit
            .toString()
            .length);
        newValue = '$intPart.$truncDigit';
        resultValue = double.parse(newValue);
        return resultValue;
      }

      ///verify fract part
      try {
        fractPart = aValue.substring(aValue.indexOf('.') + 1);
      } catch (_) {
        fractPart = '0';
      }

      if ('$fractPart'.length > 3 && digits < 3){
        double tempNumber = roundAbnt(aValue, 3);

        try {
          intPart = '$tempNumber'.substring(0, '$tempNumber'.indexOf('.'));
        } catch (_) {
          intPart = '$tempNumber';
          truncDigit = '0';
          truncDigit = truncDigit + '0' * (digits - truncDigit
              .toString()
              .length);
          newValue = '$intPart.$truncDigit';
          resultValue = double.parse(newValue);
          return resultValue;
        }

        ///verify fract part
        String fractTemp = '';
        try {
          fractTemp = '$tempNumber'.substring('$tempNumber'.indexOf('.') + 1);
        } catch (_) {
          fractTemp = '0';
        }

        fractPart = fractTemp;
      }

      ///calc the digits will be truncade
      try {
        truncDigit = fractPart.substring(0, digits);
      } catch (_) {
        truncDigit = fractPart.substring(0);
        truncDigit = truncDigit + '0' * (digits - truncDigit
            .toString()
            .length);
      }

      ///calc the rest digit after de trunc digits
      try {
        restDigit = fractPart.substring(digits, digits + 1);
      } catch (_) {
        restDigit = '0';
      }

      try {
        restAllDigits = fractPart.substring(digits);
      } catch (_) {
        restAllDigits = '0';
      }

      /// calc de digit will be mantained
      try {
        mantainDigit = fractPart.substring(1, digits);
      } catch (_) {
        mantainDigit = fractPart.substring(0);
      }

      restValue = int.parse(restDigit);
      resultValue = 0.00;

      /// if rest digit < 5 the trunc digit will be maintained
      if (restValue < 5) {
        newValue = '$intPart.$truncDigit';
        resultValue = double.parse(newValue);
      } else if (restValue > 5) {
        /// if rest digit > 5 the trunc digit sum 1
        int addDigit =  int.parse(truncDigit) + 1;

        if (addDigit == 0) {
          intPart = '${int.parse(intPart) + 1}';
        }

        String zeroTemp = addDigit < 10? '0':'';

        newValue = '$intPart.$zeroTemp$addDigit';
        resultValue = double.parse(newValue);
      } else if (restValue == 5) {
        /**
         * in this case if rest digit == 5
         * if is odd sum 1
         * if is pair and don't have any 0 sum 1
         * if is pair and have any 0 maintain the number
         */

        int matainValue = int.parse(mantainDigit);
        if ((matainValue % 2) != 0) {
          int addDigit = int.parse(truncDigit) + 1;

          if (addDigit == 0) {
            intPart = '${int.parse(intPart) + 1}';
          }

          String zeroTemp = addDigit < 10? '0':'';
          newValue = '$intPart.$zeroTemp$addDigit';

          resultValue = double.parse(newValue);
        } else {

        int addDigit = int.parse(truncDigit);

        String zeroTemp = addDigit < 10? '0':'';
        newValue = '$intPart.$zeroTemp$addDigit';

        resultValue = double.parse(newValue);

        }
      }

      return resultValue;
    }catch(_){
      final resul = double.parse(aValue);
      return resul;
    }
  }
}
