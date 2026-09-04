import 'package:roundabnt/roundabnt.dart';

/// Demonstrates the roundabnt package with various ABNT rounding scenarios.
void main() {
  const roundabnt = RoundAbnt();

  // Standard cases — digit after cutoff < 5 or > 5
  print(roundabnt.roundAbnt(88.241, 2));  // 88.24
  print(roundabnt.roundAbnt(88.248, 2));  // 88.25
  print(roundabnt.roundAbnt(88.2858, 2)); // 88.29
  print(roundabnt.roundAbnt(88.2358, 2)); // 88.24

  // Tie-breaking (digit == 5): rounds to even last digit
  print(roundabnt.roundAbnt(88.2450, 2)); // 88.24 — last kept digit (4) is even
  print(roundabnt.roundAbnt(88.2550, 2)); // 88.26 — last kept digit (5) is odd

  // Negative number
  print(roundabnt.roundAbnt(-3.175, 2));  // -3.18

  // Using delta to compensate for floating-point representation noise
  print(roundabnt.roundAbnt(1.005, 2, delta: 0.0001)); // 1.01
}
