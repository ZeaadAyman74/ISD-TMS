import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay; // Delay before retrying
  final List<int> retryableStatusCodes; // Which HTTP status codes should trigger a retry

  RetryInterceptor(this.dio,{
    this.maxRetries = 3, // Default to 3 retries
    this.retryDelay = const Duration(seconds: 1), // Default 1-second delay
    this.retryableStatusCodes = const [
      408, // Request Timeout
      429, // Too Many Requests
      500, // Internal Server Error
      502, // Bad Gateway
      503, // Service Unavailable
      504, // Gateway Timeout
    ],
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the error is retryable (e.g., network issues, server errors)
    // and if we haven't exceeded the max retries.
    bool shouldRetry = _shouldRetry(err);
    int retryCount = err.requestOptions.extra['retry_count'] ?? 0;

    if (shouldRetry && retryCount < maxRetries) {
      retryCount++;
      err.requestOptions.extra['retry_count'] = retryCount;

      printMe('Retrying request ${err.requestOptions.path} (Attempt $retryCount/$maxRetries)');

      // Implement exponential backoff for delays
      final delay = retryDelay * retryCount;
      await Future.delayed(delay);

      try {
        // Create a new request using the original request options
        // We must use `dio.fetch` or `dio.request` to ensure interceptors are run again
        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response); // Resolve the original request with the new response
      } on DioException catch (e) {
        // If the retry also fails, pass that error down
        handler.next(e);
      }
    } else {
      // If not retryable or max retries reached, pass the error down the chain
      handler.next(err);
    }
  }

  // Helper to determine if an error should trigger a retry
  bool _shouldRetry(DioException error) {
    // Retry on certain DioException types (network issues, timeouts)
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return true;
    }

    // Retry on specific HTTP status codes
    if (error.response != null && retryableStatusCodes.contains(error.response!.statusCode)) {
      return true;
    }

    // You might want to add more conditions here, e.g., if (error.error is SocketException)
    return false;
  }
}