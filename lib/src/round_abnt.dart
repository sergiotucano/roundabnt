import 'package:roundabnt/roundabnt.dart';
import 'dart:math' as math;


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
  double roundAbnt(double aValue, int digits, {double delta = 0.00001}) {

    try {
      // Check if the value is negative
      var negativo = (aValue < 0);

      // Calculate the power of 10
      var pow = math.pow(10, digits.abs());
      var powValue = aValue.abs() / 10;
      var intValue = powValue.truncate();
      var fracValue = powValue - intValue;

      powValue = _simpleRoundToEX(fracValue * 10 * pow, -9);
      var intCalc = powValue.truncate();
      var fracCalc = (fracValue * 100).truncate();

      // Apply ABNT rounding rules
      if (fracCalc > 50) {
        intCalc++;
      } else if (fracCalc == 50) {
        var lastNumber = (intCalc / 10).truncate() % 10;

        if (lastNumber.isOdd) {
          intCalc++;
        } else {
          var restPart = (powValue * 10) % 10;

          if (restPart > delta) intCalc++;
        }
      }

      // Calculate the final rounded value
      var result = (intValue * 10 + intCalc / pow);

      // Apply sign to the result if the original value was negative
      if (negativo) result = -result;

      return result;
    } catch (_) {
      // Return the original number in case of error
      return aValue;
    }

  }

  // Function to perform simple rounding with given precision
  double _simpleRoundToEX(double value, int digits) {
    var shift = math.pow(10, digits.toDouble()).toInt();
    return (value * shift).roundToDouble() / shift;
  }
}
