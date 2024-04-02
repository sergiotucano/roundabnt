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
      var intValue = aValue.toInt();
      var fracValue = (aValue - intValue).abs();

      var powValue = _simpleRoundToEX(fracValue * pow, 12); // Increase precision
      var intCalc = powValue.toInt();
      var fracCalc = ((powValue * 100).toInt()) % 100; // Remove +1

      // Apply ABNT rounding rules
      if (fracCalc > 50 || (fracCalc == 50 && intCalc % 2 == 1)) {
        intCalc++;
      }

      // Calculate the final rounded value
      var result = (intValue * pow + intCalc) / pow;

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
    var shift = math.pow(10, digits.toDouble());
    return (value * shift).roundToDouble() / shift;
  }

}
