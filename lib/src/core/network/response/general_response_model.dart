import 'validation_model.dart';

class GeneralResponseModel {
  const GeneralResponseModel(
      {required this.message,
      required this.success,
      this.validation,
      this.errorModel});

  final String message;
  final bool success;
  final ValidationModel? validation;
  final ErrorModel? errorModel;

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    // If the error response comes as { "data": { "success": false, "message": "..." } }
    final dynamic dataJson = json['data'];
    final Map<String, dynamic> data = (dataJson is Map<String, dynamic>) ? dataJson : json;

    return GeneralResponseModel(
      message: data['message'] ?? json['message'] ?? "",
      success: data['success'] ?? json['success'] ?? true,
      errorModel:  ErrorModel.fromJson(json),
    );
  }
}

class ErrorModel {
  final String? message;
  final int? statusCode;


  ErrorModel({this.message, this.statusCode});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['data']['message']??json['message'],
        statusCode: json['data']['status']??json['status'],
    );
  }
}
