# Flutter Network Simulator

A Flutter package to simulate network conditions like slow internet, API failures, and delays for testing UI and API behavior.

---

## ✨ Features

- 🐢 Simulate slow network (latency)
- ❌ Simulate random API failures
- ⚙️ Adjustable failure rate (0% – 100%)
- 🎛 Built-in debug control panel UI
- 🔌 Easy integration with Dio interceptor
- 📱 Works on real devices (simulation-based)

---

## 🚀 Getting Started

Add dependency in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_network_simulator: ^0.0.1


  📦 Usage

1️⃣ Enable Simulator
NetworkSimulator.enabled = true;
NetworkSimulator.speed = NetworkSpeed.slow;
NetworkSimulator.failureRate = 0.3;

2️⃣ Add Dio Interceptor

final dio = Dio();

dio.interceptors.add(NetworkSimulatorInterceptor());

3️⃣ Use Debug Panel (Optional)
NetworkSimulatorPanel()

 Example
ElevatedButton(
  onPressed: () async {
    try {
      final res = await dio.get("https://jsonplaceholder.typicode.com/posts");
      print("Success");
    } catch (e) {
      print("Error: $e");
    }
  },
  child: Text("Call API"),
)

Use Cases
Test slow network UI (loaders, shimmer)
Handle API failure scenarios
Improve user experience under poor network
Debug retry mechanisms

⚠️ Note

This package does not control real internet speed.
It simulates network conditions inside your app for testing purposes.

🤝 Contributing

Feel free to contribute by creating issues or pull requests on GitHub:

👉 https://github.com/RAKESHDAS1997/flutter_network_simulator