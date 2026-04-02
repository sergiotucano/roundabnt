/// Contract for ABNT-compliant number rounding.
///
/// Implement [roundAbnt] to apply Brazilian NBR 5891 rounding rules
/// (symmetric rounding with tie-breaking to even).
///
/// Reference: https://pt.wikipedia.org/wiki/Arredondamento
abstract interface class RoundAbntImplementation {
  const RoundAbntImplementation();

  /// Rounds [value] to [digits] decimal places using ABNT (NBR 5891) rules.
  ///
  /// The [delta] parameter is a small epsilon added before rounding to
  /// compensate for floating-point representation noise. Defaults to `0.00001`.
  ///
  /// Returns the rounded value. If an internal error occurs the original
  /// [value] is returned unchanged.
  ///
  /// Example:
  /// ```dart
  /// roundAbnt(88.2450, 2);              // 88.24 — tie, even digit kept
  /// roundAbnt(88.2550, 2);              // 88.26 — tie, odd digit rounded up
  /// roundAbnt(-3.175, 2);               // -3.18
  /// roundAbnt(1.005, 2, delta: 0.0001); // 1.01
  /// ```
  double roundAbnt(double value, int digits, {double delta = 0.00001});
}
