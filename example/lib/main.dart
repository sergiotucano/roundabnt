import 'package:roundabnt/round_abnt.dart';

/// example how to use the roundabnt package
void main() {

  /// call RoundAbnt function
  final roundabnt = RoundAbnt();

  double resp = 0.00;
  resp = roundabnt.roundAbnt('88.241',2); /// return 88.24
  print('$resp');

  resp = roundabnt.roundAbnt('88.248',2); /// return 88.25
  print('$resp');

  resp = roundabnt.roundAbnt('88.2858',2); /// return 88.29
  print('$resp');

  resp = roundabnt.roundAbnt('88.2358',2); /// return 88.24
  print('$resp');

  resp = roundabnt.roundAbnt('88.2458',2); /// return 88.25
  print('$resp');

  resp = roundabnt.roundAbnt('88.2450',2); /// return 88.24
  print('$resp');

}