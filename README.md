# Round Abnt

A Dart package to round numbers using Brazilian ABNT rules (NBR 5891).

[![Project Owner](https://img.shields.io/badge/owner-sergiotucano-dd8800)](https://github.com/sergiotucano/)
[![GitHub stars](https://img.shields.io/github/stars/sergiotucano/roundabnt?style=social)](https://github.com/sergiotucano/roundabnt)
[![GitHub forks](https://img.shields.io/github/forks/sergiotucano/roundabnt?style=social)](https://github.com/sergiotucano/roundabnt/fork)

## About ABNT Rounding (NBR 5891)

Brazilian ABNT standard NBR 5891 defines symmetric rounding with a specific
tie-breaking rule when the dropped digit is exactly 5:

| Input    | Digits | Result | Reason                                      |
|----------|--------|--------|---------------------------------------------|
| 88.245   | 2      | 88.24  | tie → last kept digit (4) is even, keep     |
| 88.255   | 2      | 88.26  | tie → last kept digit (5) is odd, round up  |
| 88.248   | 2      | 88.25  | dropped digit > 5, always round up          |
| -3.175   | 2      | -3.18  | magnitude rounded first, then sign applied  |

This differs from "round half up" (common in software) and from standard
"round half to even" (banker's rounding) in how negative numbers are handled.

## Installation

```bash
# Dart
dart pub add roundabnt

# Flutter
flutter pub add roundabnt
```

## Import

```dart
import 'package:roundabnt/roundabnt.dart';
```

## Example

```dart
void main() {
  const r = RoundAbnt();

  print(r.roundAbnt(88.241, 2));  // 88.24
  print(r.roundAbnt(88.255, 2));  // 88.26 — tie-break to even
  print(r.roundAbnt(-3.175, 2));  // -3.18

  // Use delta when floating-point representation causes off-by-epsilon errors
  print(r.roundAbnt(1.005, 2, delta: 0.0001)); // 1.01
}
```
