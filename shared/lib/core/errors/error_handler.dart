
import 'package:dio/dio.dart';

import 'failuer.dart';


class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const TimeoutFailure("⏰ Connection timed out, please try again.");

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final msg = _extractErrorMessage(error);
          return ServerFailure(msg.isNotEmpty ? msg : "Server error [$statusCode]");

        case DioExceptionType.connectionError:
          return const NetworkFailure("🌐 No Internet connection.");

        case DioExceptionType.cancel:
          return const UnexpectedFailure("❌ Request was cancelled.");

        default:
          return const UnexpectedFailure("Something went wrong, please try again.");
      }
    } else {
      return const UnexpectedFailure("Unexpected error occurred.");
    }
  }

  static String _extractErrorMessage(DioException error) {
    try {
      final data = error.response?.data;

      if (data is Map<String, dynamic>) {
        return data["message"] ??
            data["error"] ??
            data["msg"] ??
            "Unknown server error";
      }


      if (data is String) {
        return data;
      }

      return "Unknown error";
    } catch (_) {
      return "Error parsing server response";
    }
  }
}

