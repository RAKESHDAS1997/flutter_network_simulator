import 'package:dio/dio.dart';
import 'simulator.dart';

class NetworkSimulatorInterceptor extends Interceptor {
  @override

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (NetworkSimulator.enabled) {
      await Future.delayed(NetworkSimulator.delay);

      if (NetworkSimulator.shouldFail()) {
        return handler.reject(
          DioException(
            requestOptions: options,
            error: "Simulated Network Error",
          ),
        );
      }
    }

    handler.next(options);
  }
}