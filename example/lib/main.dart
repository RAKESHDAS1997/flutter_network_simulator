import 'package:flutter/material.dart';
import 'package:flutter_network_simulator/flutter_network_simulator.dart';

void main() {
  // Enable the network simulator and set speed and failure rate
  NetworkSimulator.enabled = true;
  NetworkSimulator.speed = NetworkSpeed.fast;
  NetworkSimulator.failureRate = 1.0; 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Simulator Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Network Simulator Example')),
       body: Center(
  child: Builder(
    builder: (context) => ElevatedButton(
      onPressed: () async {
        print('Button pressed! Simulating network delay: \\${NetworkSimulator.delay}');
        // Simulate network delay
        await Future.delayed(NetworkSimulator.delay);
        final failed = NetworkSimulator.shouldFail();
        print('Network request result: \\${failed ? 'FAILED' : 'SUCCEEDED'}');
        final snackBar = SnackBar(
          content: Text(failed ? 'Request failed!' : 'Request succeeded!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('Simulate Network Request'),
    ),
  ),
),)
    );
  }
}
