import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isd_tms/src/core/network/response/general_response_model.dart';
import 'package:isd_tms/src/core/network/response/validation_model.dart';


part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions implements Exception {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(
      ErrorModel error, ValidationModel? validation) = UnauthorizedRequest;

  const factory NetworkExceptions.unauthenticatedRequest(
      ErrorModel error, ValidationModel? validation) = UnauthenticatedRequest;

  const factory NetworkExceptions.badRequest(
      ErrorModel error, ValidationModel? validation) = BadRequest;

  const factory NetworkExceptions.allowedRequest(
      ErrorModel error, ValidationModel? validation) = AllowedRequest;

  const factory NetworkExceptions.notFound(
      ErrorModel error, ValidationModel? validation) = NotFound;

  const factory NetworkExceptions.methodNotAllowed(
      ErrorModel error, ValidationModel? validation) = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable(ValidationModel? validation) =
      NotAcceptable;

  const factory NetworkExceptions.requestTimeout(ValidationModel? validation) =
      RequestTimeout;

  const factory NetworkExceptions.sendTimeout(ValidationModel? validation) =
      SendTimeout;

  const factory NetworkExceptions.receiveTimeout(ValidationModel? validation) =
      RecieveTimeOut;

  const factory NetworkExceptions.conflict(
      ErrorModel error, ValidationModel? validation) = Conflict;

  const factory NetworkExceptions.internalServerError(
      ErrorModel error, ValidationModel? validation) = InternalServerError;

  const factory NetworkExceptions.notImplemented(ValidationModel? validation) =
      NotImplemented;

  const factory NetworkExceptions.serviceUnavailable(
      ValidationModel? validation) = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException(ValidationModel? validation) =
      FormatException;

  const factory NetworkExceptions.unableToProcess(
      ErrorModel error, ValidationModel? validation) = UnableToProcess;

  const factory NetworkExceptions.defaultError(
      ErrorModel error, ValidationModel? validation) = DefaultError;

  const factory NetworkExceptions.unexpectedError(ValidationModel? validation) =
      UnexpectedError;

  const factory NetworkExceptions.locationServiceException() = LocationServiceException;

  const factory NetworkExceptions.locationPermissionException() = LocationPermissionException;



  static NetworkExceptions handleResponse(Response? response) {
    GeneralResponseModel? generalModel;
    generalModel = GeneralResponseModel.fromJson(response?.data);
    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 302:
        return NetworkExceptions.notFound(
            generalModel.errorModel!, generalModel.validation);
      case 400:
        return NetworkExceptions.badRequest(
            generalModel.errorModel!, generalModel.validation);
      case 401:
        return NetworkExceptions.unauthorizedRequest(
            generalModel.errorModel!, generalModel.validation);
      case 402:
      case 403:
        return NetworkExceptions.methodNotAllowed(
            generalModel.errorModel!, generalModel.validation);
      case 404:
        return NetworkExceptions.conflict(
            generalModel.errorModel!, generalModel.validation);
      case 418:
        return NetworkExceptions.allowedRequest(
            generalModel.errorModel!, generalModel.validation);
      case 409:
        return NetworkExceptions.conflict(
            generalModel.errorModel!, generalModel.validation);
      case 408:
        return NetworkExceptions.requestTimeout(generalModel.validation);
      case 422:
        return NetworkExceptions.unableToProcess(
            generalModel.errorModel!, generalModel.validation);
      case 500:
        return NetworkExceptions.internalServerError(
            generalModel.errorModel!, generalModel.validation);
      case 503:
        return NetworkExceptions.serviceUnavailable(generalModel.validation);
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
            ErrorModel(message: "Received invalid status code: $responseCode"),
            generalModel.validation);
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.badResponse:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.badCertificate:
              return NetworkExceptions.handleResponse(error.response);
            case DioExceptionType.connectionError:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;

            case DioExceptionType.receiveTimeout:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError(null);
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException(null);
      } catch (_) {
        return const NetworkExceptions.unexpectedError(null);
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess(ErrorModel(message: error.toString()), null);
      } else {
        return const NetworkExceptions.unexpectedError(null);
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
      notImplemented: (ValidationModel? validation) {
        errorMessage = "";
      },
      unauthenticatedRequest: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      requestCancelled: () {
        errorMessage = "";
      },
      internalServerError: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      notFound: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      serviceUnavailable: (ValidationModel? validation) {
        errorMessage = "";
      },
      methodNotAllowed: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      badRequest: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      unauthorizedRequest: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      unexpectedError: (ValidationModel? validation) {
        errorMessage = "Unexpected error";
      },
      requestTimeout: (ValidationModel? validation) {
        errorMessage = "Request timeout";
      },
      receiveTimeout: (ValidationModel? validation) {
        errorMessage = "Receive timeout";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      sendTimeout: (ValidationModel? validation) {
        errorMessage = "Connection timeout";
      },
      unableToProcess: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      defaultError: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      formatException: (ValidationModel? validation) {
        errorMessage = "Something went wrong";
      },
      notAcceptable: (ValidationModel? validation) {
        errorMessage = "Not acceptable";
      },
      allowedRequest: (ErrorModel errorModel, ValidationModel? validation) {
        errorMessage = errorModel.message??'';
      },
      locationServiceException: () => errorMessage="'Please enable location service'",
      locationPermissionException: () => errorMessage='Please enable location permission',
    );
    return errorMessage;
  }

  static ValidationModel? getValidation(NetworkExceptions networkExceptions) {
    ValidationModel? validationModel;
    networkExceptions.when(
      notImplemented: (ValidationModel? validation) {
        validation = validation;
      },
      unauthenticatedRequest: (ErrorModel error, ValidationModel? validation) {
        validation = validation;
      },
      requestCancelled: () {},
      internalServerError: (ErrorModel error, ValidationModel? validation) {
        validationModel = validation;
      },
      notFound: (ErrorModel reason, validation) {
        validationModel = validation;
      },
      serviceUnavailable: (validation) {
        validationModel = validation;
      },
      methodNotAllowed: (ErrorModel error, validation) {
        validationModel = validation;
      },
      badRequest: (ErrorModel error, validation) {
        validationModel = validation;
      },
      unauthorizedRequest: (ErrorModel reason, validation) {
        validationModel = validation;
      },
      unexpectedError: (validation) {
        validationModel = validation;
      },
      requestTimeout: (validation) {
        validationModel = validation;
      },
      receiveTimeout: (validation) {
        validationModel = validation;
      },
      noInternetConnection: () {},
      conflict: (ErrorModel error, validation) {
        validationModel = validation;
      },
      sendTimeout: (validation) {
        validationModel = validation;
      },
      unableToProcess: (ErrorModel error, validation) {
        validationModel = validation;
      },
      defaultError: (ErrorModel error, validation) {
        validationModel = validation;
      },
      formatException: (validation) {
        validationModel = validation;
      },
      notAcceptable: (validation) {
        validationModel = validation;
      },
      allowedRequest: (ErrorModel error, validation) {
        validationModel = validation;
      },
      locationPermissionException: () {},
      locationServiceException: () {},
    );
    return validationModel;
  }

}
