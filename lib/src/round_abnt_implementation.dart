import 'package:flutter/foundation.dart';

/// This method calc the round value with brazilian abnt rule
/// https://pt.wikipedia.org/wiki/Arredondamento

@immutable
abstract class RoundAbntImplementation {
  /// call the roundAbnt method
  double roundAbnt(double aValue, int digits, {double delta = 0.00001});
}
