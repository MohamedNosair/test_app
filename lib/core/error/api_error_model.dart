class ApiErrorModel {
  final bool success;
  final String message;
  final Map<String, dynamic>? errors;

  ApiErrorModel({required this.success, required this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      errors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors'])
          : null,
    );
  }
}