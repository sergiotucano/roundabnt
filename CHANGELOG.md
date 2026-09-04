## 1.0.5+0

* Updated Dart SDK constraint to `>=3.0.0 <4.0.0`
* Replaced deprecated `library` directive with a package-level dartdoc comment
* Replaced `@immutable abstract class` with `abstract interface class` (Dart 3)
* Fixed circular import in `round_abnt.dart` (was importing the barrel file)
* Renamed parameters and variables to follow Dart conventions:
  * `aValue` → `value`
  * `negativo` → `isNegative`
  * `pow` → `factor`
* Renamed internal helper `_simpleRoundToEX` → `_roundToDecimalPlaces`
* Added `const` constructors to both `RoundAbnt` and `RoundAbntImplementation`
* Added full dartdoc to all public API members
* Removed dead commented-out code and inline attribution comments

## 1.0.4+2

* Fix Delta value

## 1.0.3+1

* Fix bug when increase precision

## 1.0.3+0

* Increase precision

## 1.0.2+0

* Fix code using delta value by @andrellopes

## 1.0.1+0

* Fix abnt rule

## 1.0.0+0

* Refactoring all round code
* BREAKING CHANGE: the value parameter is now a double

## 0.0.4+1

* Fix round calc with 3 decimals

## 0.0.4+0

* Fix round calc

## 0.0.3+1

* Return the same number if exception occurs

## 0.0.2+1

* Add verification for int number

## 0.0.1+2

* First version of package

## 0.0.1+1

* First version of package by @sergiotucano
