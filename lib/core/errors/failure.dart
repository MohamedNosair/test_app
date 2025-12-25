abstract class Failure {
  final String message;
  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class AuthFailure extends Failure {
  AuthFailure(super.message);
}

class ValidationFailure extends Failure {
  final Map<String, String> errors;
  ValidationFailure(this.errors) : super("Validation error");
}

class BusinessFailure extends Failure {
  BusinessFailure(super.message);
}

class ParsingFailure extends Failure {
  ParsingFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

extension FailureExtension on Failure {
  String getUserMessage() {
    if (this is ValidationFailure) {
      final validationFailure = this as ValidationFailure;
      if (validationFailure.errors.isEmpty) {
        return 'خطأ في البيانات المدخلة';
      }
      return validationFailure.errors.values.first;
    }

    if (this is NetworkFailure) {
      return 'تحقق من اتصالك بالإنترنت';
    }

    if (this is AuthFailure) {
      return 'خطأ في المصادقة. يرجى تسجيل الدخول مرة أخرى';
    }

    if (this is ServerFailure) {
      return 'خطأ في السيرفر. حاول مرة أخرى';
    }

    if (this is ParsingFailure) {
      return 'حدث خطأ في معالجة البيانات';
    }

    if (this is BusinessFailure) {
      return message;
    }

    return message.isNotEmpty ? message : 'حدث خطأ غير متوقع';
  }

  bool canRetry() {
    return this is NetworkFailure ||
           this is ServerFailure ||
           this is UnknownFailure;
  }
}
