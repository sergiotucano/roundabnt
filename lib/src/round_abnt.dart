import 'dart:math' as math;

import 'round_abnt_implementation.dart';

/// ABNT rounding implementation (NBR 5891 — symmetric rounding).
///
/// Rules:
/// - If the digit after the last kept digit is **less than 5**: keep unchanged.
/// - If it is **greater than 5**: increment the last kept digit by 1.
/// - If it is **exactly 5**:
///   - If the last kept digit is **odd**: increment by 1.
///   - If the last kept digit is **even**: keep if followed only by zeros;
///     otherwise increment by 1.
///
/// Reference: https://www.sofazquemsabe.com/2011/01/como-fazer-arredondamento-da-numeracao.html
class RoundAbnt implements RoundAbntImplementation {
  /// Creates a const instance of [RoundAbnt].
  const RoundAbnt();

  @override
  double roundAbnt(double value, int digits, {double delta = 0.00001}) {
    try {
      final isNegative = (value < 0);

      value = value.abs() + delta;

      final factor = math.pow(10, digits.abs());
      final intValue = value.toInt();
      final fracValue = (value - intValue).abs();

      final powValue =
          _roundToDecimalPlaces(fracValue * factor, 12);

      var intCalc = powValue.toInt();
      final fracCalc = ((powValue * 1000).toInt()) % 1000;

      // Apply ABNT rounding rules
      if (fracCalc > 500 || (fracCalc == 500 && intCalc % 2 == 1)) {
        intCalc++;
      }

      // Calculate the final rounded value
      var result = (intValue * factor + intCalc) / factor;

      // Apply sign to the result if the original value was negative
      if (isNegative) result = -result;

      return result;
    } catch (_) {
      // Return the original number in case of error
      return value;
    }
  }

  /// Rounds [value] to [digits] significant decimal places using standard
  /// half-up rounding. Used internally to reduce floating-point noise.
  double _roundToDecimalPlaces(double value, int digits) {
    final shift = math.pow(10, digits);
    return (value * shift).roundToDouble() / shift;
  }
}
