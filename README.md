# Round Abnt

A Dart package to round numbers in brazilian abnt rule

[![Project Owner](https://img.shields.io/badge/owner-sergiotucano-dd8800)](https://github.com/sergiotucano/)
![GitHub stars](https://img.shields.io/github/stars/sergiotucano/roundabnt?style=social)
[![GitHub forks](https://img.shields.io/github/forks/sergiotucano/roundabnt?style=social)](https://github.com/sergiotucano/roundabnt/fork)

## Installation

```bash
flutter pub add roundabnt
```

## Import

```dart
import 'package:roundabnt/roundabnt.dart';
```

### Exemple

```dart
void main() {
  final roundabnt = RoundAbnt();

  double resp = 0.00;
  resp = roundabnt.roundAbnt('88.241',2); // return 88.24
  print('$resp');
}
```
