import 'package:flutter/foundation.dart';

/// This method calc the round value with brazilian abnt rule
/// https://pt.wikipedia.org/wiki/Arredondamento

@immutable
abstract class RoundAbntImplementation {

  double roundAbnt(String aValue, int digits);
}