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
      errorModel: json['error'] != null 
          ? ErrorModel.fromJson(json['error']) 
          : (data['success'] == false ? ErrorModel.fromData(data) : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'error': errorModel?.toJson(),
      'validation': validation?.toJson()
    };
  }
}

class ErrorModel {
  final int? code;
  final int? statusCode;
  final String? title;
  final String? details;

  ErrorModel({this.code, this.statusCode, this.title, this.details});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
        code: json['code'],
        title: json['title'],
        statusCode: json['status'],
        details: json['details'] ?? json['error'] ?? json['error_code']);
  }

  factory ErrorModel.fromData(Map<String, dynamic> data) {
    return ErrorModel(
      title: 'Error',
      details: data['message'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'code': code, 'title': title, 'details': details};
}
