import 'package:flutter/material.dart';
import 'simulator.dart';
import 'enums.dart';

class NetworkSimulatorPanel extends StatefulWidget {
  const NetworkSimulatorPanel({super.key});

  @override
  State<NetworkSimulatorPanel> createState() =>
      _NetworkSimulatorPanelState();
}

class _NetworkSimulatorPanelState extends State<NetworkSimulatorPanel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text("Network Simulator"),

            SwitchListTile(
              title: const Text("Enable"),
              value: NetworkSimulator.enabled,
              onChanged: (val) {
                setState(() {
                  NetworkSimulator.enabled = val;
                });
              },
            ),

            DropdownButton<NetworkSpeed>(
              value: NetworkSimulator.speed,
              items: NetworkSpeed.values.map((speed) {
                return DropdownMenuItem(
                  value: speed,
                  child: Text(speed.name),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  NetworkSimulator.speed = val!;
                });
              },
            ),

            Slider(
              value: NetworkSimulator.failureRate,
              min: 0,
              max: 1,
              divisions: 10,
              label: "${(NetworkSimulator.failureRate * 100).toInt()}%",
              onChanged: (val) {
                setState(() {
                  NetworkSimulator.failureRate = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}