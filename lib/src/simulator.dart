import 'dart:math';
import 'enums.dart';

class NetworkSimulator {
  static bool enabled = false;
  static NetworkSpeed speed = NetworkSpeed.fast;
  static double failureRate = 0.0;

  static Duration get delay {
    switch (speed) {
  case NetworkSpeed.slow:
    return const Duration(seconds: 3);
  case NetworkSpeed.medium:
    return const Duration(seconds: 1);
  case NetworkSpeed.fast:
    return const Duration(milliseconds: 100);
}
  }

  static bool shouldFail() {
    return Random().nextDouble() < failureRate;
  }
}