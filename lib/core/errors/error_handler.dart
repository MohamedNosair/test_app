import 'package:dio/dio.dart';
import 'api_error_model.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    // =========================
    // Dio Errors
    // =========================
    if (error is DioException) {
      // -------------------------
      // DioExceptionType
      // -------------------------
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          return NetworkFailure("No internet connection");

        case DioExceptionType.cancel:
          return NetworkFailure("Request was cancelled");

        case DioExceptionType.badCertificate:
          return NetworkFailure("Bad SSL certificate");

        case DioExceptionType.badResponse:
          return _handleServerError(error);

        case DioExceptionType.unknown:
          return UnknownFailure("Unexpected network error");
      }
    }

    // =========================
    // Parsing Error
    // =========================
    if (error is FormatException) {
      return ParsingFailure("Invalid response format");
    }

    // =========================
    // Already Failure
    // =========================
    if (error is Failure) {
      return error;
    }

    // =========================
    // Unknown
    // =========================
    return UnknownFailure(error.toString());
  }

  // =========================
  // Server Error Handler
  // =========================
  static Failure _handleServerError(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode ?? 0;
    final data = response?.data;

    ApiErrorModel? apiError;

    if (data is Map<String, dynamic>) {
      try {
        apiError = ApiErrorModel.fromJson(data);
      } catch (_) {
        return ParsingFailure("Failed to parse error response");
      }
    }

    switch (statusCode) {
      case 401:
      case 403:
        return AuthFailure(apiError?.message ?? "Unauthorized");

      case 422:
        if (apiError?.errors != null) {
          final Map<String, String> validationErrors = {};
          apiError!.errors!.forEach((key, value) {
            validationErrors[key] = value.toString();
          });
          return ValidationFailure(validationErrors);
        }
        return ValidationFailure({"error": "Validation error"});

      case 200:
        if (apiError?.success == false) {
          return BusinessFailure(apiError!.message);
        }
        return UnknownFailure("Unexpected business error");

      default:
        return ServerFailure(
          apiError?.message ?? "Server error ($statusCode)",
        );
    }
  }
}
