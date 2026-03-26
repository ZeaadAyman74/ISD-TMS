// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkExceptions {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkExceptions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions()';
}


}

/// @nodoc
class $NetworkExceptionsCopyWith<$Res>  {
$NetworkExceptionsCopyWith(NetworkExceptions _, $Res Function(NetworkExceptions) __);
}


/// Adds pattern-matching-related methods to [NetworkExceptions].
extension NetworkExceptionsPatterns on NetworkExceptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RequestCancelled value)?  requestCancelled,TResult Function( UnauthorizedRequest value)?  unauthorizedRequest,TResult Function( UnauthenticatedRequest value)?  unauthenticatedRequest,TResult Function( BadRequest value)?  badRequest,TResult Function( AllowedRequest value)?  allowedRequest,TResult Function( NotFound value)?  notFound,TResult Function( MethodNotAllowed value)?  methodNotAllowed,TResult Function( NotAcceptable value)?  notAcceptable,TResult Function( RequestTimeout value)?  requestTimeout,TResult Function( SendTimeout value)?  sendTimeout,TResult Function( RecieveTimeOut value)?  receiveTimeout,TResult Function( Conflict value)?  conflict,TResult Function( InternalServerError value)?  internalServerError,TResult Function( NotImplemented value)?  notImplemented,TResult Function( ServiceUnavailable value)?  serviceUnavailable,TResult Function( NoInternetConnection value)?  noInternetConnection,TResult Function( FormatException value)?  formatException,TResult Function( UnableToProcess value)?  unableToProcess,TResult Function( DefaultError value)?  defaultError,TResult Function( UnexpectedError value)?  unexpectedError,TResult Function( LocationServiceException value)?  locationServiceException,TResult Function( LocationPermissionException value)?  locationPermissionException,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that);case UnauthenticatedRequest() when unauthenticatedRequest != null:
return unauthenticatedRequest(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case AllowedRequest() when allowedRequest != null:
return allowedRequest(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case RecieveTimeOut() when receiveTimeout != null:
return receiveTimeout(_that);case Conflict() when conflict != null:
return conflict(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case DefaultError() when defaultError != null:
return defaultError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case LocationServiceException() when locationServiceException != null:
return locationServiceException(_that);case LocationPermissionException() when locationPermissionException != null:
return locationPermissionException(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RequestCancelled value)  requestCancelled,required TResult Function( UnauthorizedRequest value)  unauthorizedRequest,required TResult Function( UnauthenticatedRequest value)  unauthenticatedRequest,required TResult Function( BadRequest value)  badRequest,required TResult Function( AllowedRequest value)  allowedRequest,required TResult Function( NotFound value)  notFound,required TResult Function( MethodNotAllowed value)  methodNotAllowed,required TResult Function( NotAcceptable value)  notAcceptable,required TResult Function( RequestTimeout value)  requestTimeout,required TResult Function( SendTimeout value)  sendTimeout,required TResult Function( RecieveTimeOut value)  receiveTimeout,required TResult Function( Conflict value)  conflict,required TResult Function( InternalServerError value)  internalServerError,required TResult Function( NotImplemented value)  notImplemented,required TResult Function( ServiceUnavailable value)  serviceUnavailable,required TResult Function( NoInternetConnection value)  noInternetConnection,required TResult Function( FormatException value)  formatException,required TResult Function( UnableToProcess value)  unableToProcess,required TResult Function( DefaultError value)  defaultError,required TResult Function( UnexpectedError value)  unexpectedError,required TResult Function( LocationServiceException value)  locationServiceException,required TResult Function( LocationPermissionException value)  locationPermissionException,}){
final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled(_that);case UnauthorizedRequest():
return unauthorizedRequest(_that);case UnauthenticatedRequest():
return unauthenticatedRequest(_that);case BadRequest():
return badRequest(_that);case AllowedRequest():
return allowedRequest(_that);case NotFound():
return notFound(_that);case MethodNotAllowed():
return methodNotAllowed(_that);case NotAcceptable():
return notAcceptable(_that);case RequestTimeout():
return requestTimeout(_that);case SendTimeout():
return sendTimeout(_that);case RecieveTimeOut():
return receiveTimeout(_that);case Conflict():
return conflict(_that);case InternalServerError():
return internalServerError(_that);case NotImplemented():
return notImplemented(_that);case ServiceUnavailable():
return serviceUnavailable(_that);case NoInternetConnection():
return noInternetConnection(_that);case FormatException():
return formatException(_that);case UnableToProcess():
return unableToProcess(_that);case DefaultError():
return defaultError(_that);case UnexpectedError():
return unexpectedError(_that);case LocationServiceException():
return locationServiceException(_that);case LocationPermissionException():
return locationPermissionException(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RequestCancelled value)?  requestCancelled,TResult? Function( UnauthorizedRequest value)?  unauthorizedRequest,TResult? Function( UnauthenticatedRequest value)?  unauthenticatedRequest,TResult? Function( BadRequest value)?  badRequest,TResult? Function( AllowedRequest value)?  allowedRequest,TResult? Function( NotFound value)?  notFound,TResult? Function( MethodNotAllowed value)?  methodNotAllowed,TResult? Function( NotAcceptable value)?  notAcceptable,TResult? Function( RequestTimeout value)?  requestTimeout,TResult? Function( SendTimeout value)?  sendTimeout,TResult? Function( RecieveTimeOut value)?  receiveTimeout,TResult? Function( Conflict value)?  conflict,TResult? Function( InternalServerError value)?  internalServerError,TResult? Function( NotImplemented value)?  notImplemented,TResult? Function( ServiceUnavailable value)?  serviceUnavailable,TResult? Function( NoInternetConnection value)?  noInternetConnection,TResult? Function( FormatException value)?  formatException,TResult? Function( UnableToProcess value)?  unableToProcess,TResult? Function( DefaultError value)?  defaultError,TResult? Function( UnexpectedError value)?  unexpectedError,TResult? Function( LocationServiceException value)?  locationServiceException,TResult? Function( LocationPermissionException value)?  locationPermissionException,}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that);case UnauthenticatedRequest() when unauthenticatedRequest != null:
return unauthenticatedRequest(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case AllowedRequest() when allowedRequest != null:
return allowedRequest(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case RecieveTimeOut() when receiveTimeout != null:
return receiveTimeout(_that);case Conflict() when conflict != null:
return conflict(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case DefaultError() when defaultError != null:
return defaultError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case LocationServiceException() when locationServiceException != null:
return locationServiceException(_that);case LocationPermissionException() when locationPermissionException != null:
return locationPermissionException(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requestCancelled,TResult Function( ErrorModel error,  ValidationModel? validation)?  unauthorizedRequest,TResult Function( ErrorModel error,  ValidationModel? validation)?  unauthenticatedRequest,TResult Function( ErrorModel error,  ValidationModel? validation)?  badRequest,TResult Function( ErrorModel error,  ValidationModel? validation)?  allowedRequest,TResult Function( ErrorModel error,  ValidationModel? validation)?  notFound,TResult Function( ErrorModel error,  ValidationModel? validation)?  methodNotAllowed,TResult Function( ValidationModel? validation)?  notAcceptable,TResult Function( ValidationModel? validation)?  requestTimeout,TResult Function( ValidationModel? validation)?  sendTimeout,TResult Function( ValidationModel? validation)?  receiveTimeout,TResult Function( ErrorModel error,  ValidationModel? validation)?  conflict,TResult Function( ErrorModel error,  ValidationModel? validation)?  internalServerError,TResult Function( ValidationModel? validation)?  notImplemented,TResult Function( ValidationModel? validation)?  serviceUnavailable,TResult Function()?  noInternetConnection,TResult Function( ValidationModel? validation)?  formatException,TResult Function( ErrorModel error,  ValidationModel? validation)?  unableToProcess,TResult Function( ErrorModel error,  ValidationModel? validation)?  defaultError,TResult Function( ValidationModel? validation)?  unexpectedError,TResult Function()?  locationServiceException,TResult Function()?  locationPermissionException,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled();case UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that.error,_that.validation);case UnauthenticatedRequest() when unauthenticatedRequest != null:
return unauthenticatedRequest(_that.error,_that.validation);case BadRequest() when badRequest != null:
return badRequest(_that.error,_that.validation);case AllowedRequest() when allowedRequest != null:
return allowedRequest(_that.error,_that.validation);case NotFound() when notFound != null:
return notFound(_that.error,_that.validation);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that.error,_that.validation);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that.validation);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that.validation);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that.validation);case RecieveTimeOut() when receiveTimeout != null:
return receiveTimeout(_that.validation);case Conflict() when conflict != null:
return conflict(_that.error,_that.validation);case InternalServerError() when internalServerError != null:
return internalServerError(_that.error,_that.validation);case NotImplemented() when notImplemented != null:
return notImplemented(_that.validation);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that.validation);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case FormatException() when formatException != null:
return formatException(_that.validation);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that.error,_that.validation);case DefaultError() when defaultError != null:
return defaultError(_that.error,_that.validation);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.validation);case LocationServiceException() when locationServiceException != null:
return locationServiceException();case LocationPermissionException() when locationPermissionException != null:
return locationPermissionException();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requestCancelled,required TResult Function( ErrorModel error,  ValidationModel? validation)  unauthorizedRequest,required TResult Function( ErrorModel error,  ValidationModel? validation)  unauthenticatedRequest,required TResult Function( ErrorModel error,  ValidationModel? validation)  badRequest,required TResult Function( ErrorModel error,  ValidationModel? validation)  allowedRequest,required TResult Function( ErrorModel error,  ValidationModel? validation)  notFound,required TResult Function( ErrorModel error,  ValidationModel? validation)  methodNotAllowed,required TResult Function( ValidationModel? validation)  notAcceptable,required TResult Function( ValidationModel? validation)  requestTimeout,required TResult Function( ValidationModel? validation)  sendTimeout,required TResult Function( ValidationModel? validation)  receiveTimeout,required TResult Function( ErrorModel error,  ValidationModel? validation)  conflict,required TResult Function( ErrorModel error,  ValidationModel? validation)  internalServerError,required TResult Function( ValidationModel? validation)  notImplemented,required TResult Function( ValidationModel? validation)  serviceUnavailable,required TResult Function()  noInternetConnection,required TResult Function( ValidationModel? validation)  formatException,required TResult Function( ErrorModel error,  ValidationModel? validation)  unableToProcess,required TResult Function( ErrorModel error,  ValidationModel? validation)  defaultError,required TResult Function( ValidationModel? validation)  unexpectedError,required TResult Function()  locationServiceException,required TResult Function()  locationPermissionException,}) {final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled();case UnauthorizedRequest():
return unauthorizedRequest(_that.error,_that.validation);case UnauthenticatedRequest():
return unauthenticatedRequest(_that.error,_that.validation);case BadRequest():
return badRequest(_that.error,_that.validation);case AllowedRequest():
return allowedRequest(_that.error,_that.validation);case NotFound():
return notFound(_that.error,_that.validation);case MethodNotAllowed():
return methodNotAllowed(_that.error,_that.validation);case NotAcceptable():
return notAcceptable(_that.validation);case RequestTimeout():
return requestTimeout(_that.validation);case SendTimeout():
return sendTimeout(_that.validation);case RecieveTimeOut():
return receiveTimeout(_that.validation);case Conflict():
return conflict(_that.error,_that.validation);case InternalServerError():
return internalServerError(_that.error,_that.validation);case NotImplemented():
return notImplemented(_that.validation);case ServiceUnavailable():
return serviceUnavailable(_that.validation);case NoInternetConnection():
return noInternetConnection();case FormatException():
return formatException(_that.validation);case UnableToProcess():
return unableToProcess(_that.error,_that.validation);case DefaultError():
return defaultError(_that.error,_that.validation);case UnexpectedError():
return unexpectedError(_that.validation);case LocationServiceException():
return locationServiceException();case LocationPermissionException():
return locationPermissionException();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requestCancelled,TResult? Function( ErrorModel error,  ValidationModel? validation)?  unauthorizedRequest,TResult? Function( ErrorModel error,  ValidationModel? validation)?  unauthenticatedRequest,TResult? Function( ErrorModel error,  ValidationModel? validation)?  badRequest,TResult? Function( ErrorModel error,  ValidationModel? validation)?  allowedRequest,TResult? Function( ErrorModel error,  ValidationModel? validation)?  notFound,TResult? Function( ErrorModel error,  ValidationModel? validation)?  methodNotAllowed,TResult? Function( ValidationModel? validation)?  notAcceptable,TResult? Function( ValidationModel? validation)?  requestTimeout,TResult? Function( ValidationModel? validation)?  sendTimeout,TResult? Function( ValidationModel? validation)?  receiveTimeout,TResult? Function( ErrorModel error,  ValidationModel? validation)?  conflict,TResult? Function( ErrorModel error,  ValidationModel? validation)?  internalServerError,TResult? Function( ValidationModel? validation)?  notImplemented,TResult? Function( ValidationModel? validation)?  serviceUnavailable,TResult? Function()?  noInternetConnection,TResult? Function( ValidationModel? validation)?  formatException,TResult? Function( ErrorModel error,  ValidationModel? validation)?  unableToProcess,TResult? Function( ErrorModel error,  ValidationModel? validation)?  defaultError,TResult? Function( ValidationModel? validation)?  unexpectedError,TResult? Function()?  locationServiceException,TResult? Function()?  locationPermissionException,}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled();case UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that.error,_that.validation);case UnauthenticatedRequest() when unauthenticatedRequest != null:
return unauthenticatedRequest(_that.error,_that.validation);case BadRequest() when badRequest != null:
return badRequest(_that.error,_that.validation);case AllowedRequest() when allowedRequest != null:
return allowedRequest(_that.error,_that.validation);case NotFound() when notFound != null:
return notFound(_that.error,_that.validation);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that.error,_that.validation);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that.validation);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that.validation);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that.validation);case RecieveTimeOut() when receiveTimeout != null:
return receiveTimeout(_that.validation);case Conflict() when conflict != null:
return conflict(_that.error,_that.validation);case InternalServerError() when internalServerError != null:
return internalServerError(_that.error,_that.validation);case NotImplemented() when notImplemented != null:
return notImplemented(_that.validation);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that.validation);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case FormatException() when formatException != null:
return formatException(_that.validation);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that.error,_that.validation);case DefaultError() when defaultError != null:
return defaultError(_that.error,_that.validation);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.validation);case LocationServiceException() when locationServiceException != null:
return locationServiceException();case LocationPermissionException() when locationPermissionException != null:
return locationPermissionException();case _:
  return null;

}
}

}

/// @nodoc


class RequestCancelled implements NetworkExceptions {
  const RequestCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.requestCancelled()';
}


}




/// @nodoc


class UnauthorizedRequest implements NetworkExceptions {
  const UnauthorizedRequest(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedRequestCopyWith<UnauthorizedRequest> get copyWith => _$UnauthorizedRequestCopyWithImpl<UnauthorizedRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedRequest&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.unauthorizedRequest(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedRequestCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $UnauthorizedRequestCopyWith(UnauthorizedRequest value, $Res Function(UnauthorizedRequest) _then) = _$UnauthorizedRequestCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$UnauthorizedRequestCopyWithImpl<$Res>
    implements $UnauthorizedRequestCopyWith<$Res> {
  _$UnauthorizedRequestCopyWithImpl(this._self, this._then);

  final UnauthorizedRequest _self;
  final $Res Function(UnauthorizedRequest) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(UnauthorizedRequest(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class UnauthenticatedRequest implements NetworkExceptions {
  const UnauthenticatedRequest(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthenticatedRequestCopyWith<UnauthenticatedRequest> get copyWith => _$UnauthenticatedRequestCopyWithImpl<UnauthenticatedRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthenticatedRequest&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.unauthenticatedRequest(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $UnauthenticatedRequestCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $UnauthenticatedRequestCopyWith(UnauthenticatedRequest value, $Res Function(UnauthenticatedRequest) _then) = _$UnauthenticatedRequestCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$UnauthenticatedRequestCopyWithImpl<$Res>
    implements $UnauthenticatedRequestCopyWith<$Res> {
  _$UnauthenticatedRequestCopyWithImpl(this._self, this._then);

  final UnauthenticatedRequest _self;
  final $Res Function(UnauthenticatedRequest) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(UnauthenticatedRequest(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class BadRequest implements NetworkExceptions {
  const BadRequest(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadRequestCopyWith<BadRequest> get copyWith => _$BadRequestCopyWithImpl<BadRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadRequest&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.badRequest(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $BadRequestCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $BadRequestCopyWith(BadRequest value, $Res Function(BadRequest) _then) = _$BadRequestCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$BadRequestCopyWithImpl<$Res>
    implements $BadRequestCopyWith<$Res> {
  _$BadRequestCopyWithImpl(this._self, this._then);

  final BadRequest _self;
  final $Res Function(BadRequest) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(BadRequest(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class AllowedRequest implements NetworkExceptions {
  const AllowedRequest(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllowedRequestCopyWith<AllowedRequest> get copyWith => _$AllowedRequestCopyWithImpl<AllowedRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllowedRequest&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.allowedRequest(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $AllowedRequestCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $AllowedRequestCopyWith(AllowedRequest value, $Res Function(AllowedRequest) _then) = _$AllowedRequestCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$AllowedRequestCopyWithImpl<$Res>
    implements $AllowedRequestCopyWith<$Res> {
  _$AllowedRequestCopyWithImpl(this._self, this._then);

  final AllowedRequest _self;
  final $Res Function(AllowedRequest) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(AllowedRequest(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class NotFound implements NetworkExceptions {
  const NotFound(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundCopyWith<NotFound> get copyWith => _$NotFoundCopyWithImpl<NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.notFound(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $NotFoundCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) _then) = _$NotFoundCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$NotFoundCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(this._self, this._then);

  final NotFound _self;
  final $Res Function(NotFound) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(NotFound(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class MethodNotAllowed implements NetworkExceptions {
  const MethodNotAllowed(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MethodNotAllowedCopyWith<MethodNotAllowed> get copyWith => _$MethodNotAllowedCopyWithImpl<MethodNotAllowed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MethodNotAllowed&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.methodNotAllowed(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $MethodNotAllowedCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $MethodNotAllowedCopyWith(MethodNotAllowed value, $Res Function(MethodNotAllowed) _then) = _$MethodNotAllowedCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$MethodNotAllowedCopyWithImpl<$Res>
    implements $MethodNotAllowedCopyWith<$Res> {
  _$MethodNotAllowedCopyWithImpl(this._self, this._then);

  final MethodNotAllowed _self;
  final $Res Function(MethodNotAllowed) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(MethodNotAllowed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class NotAcceptable implements NetworkExceptions {
  const NotAcceptable(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotAcceptableCopyWith<NotAcceptable> get copyWith => _$NotAcceptableCopyWithImpl<NotAcceptable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotAcceptable&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.notAcceptable(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $NotAcceptableCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $NotAcceptableCopyWith(NotAcceptable value, $Res Function(NotAcceptable) _then) = _$NotAcceptableCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$NotAcceptableCopyWithImpl<$Res>
    implements $NotAcceptableCopyWith<$Res> {
  _$NotAcceptableCopyWithImpl(this._self, this._then);

  final NotAcceptable _self;
  final $Res Function(NotAcceptable) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(NotAcceptable(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class RequestTimeout implements NetworkExceptions {
  const RequestTimeout(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestTimeoutCopyWith<RequestTimeout> get copyWith => _$RequestTimeoutCopyWithImpl<RequestTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestTimeout&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.requestTimeout(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $RequestTimeoutCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $RequestTimeoutCopyWith(RequestTimeout value, $Res Function(RequestTimeout) _then) = _$RequestTimeoutCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$RequestTimeoutCopyWithImpl<$Res>
    implements $RequestTimeoutCopyWith<$Res> {
  _$RequestTimeoutCopyWithImpl(this._self, this._then);

  final RequestTimeout _self;
  final $Res Function(RequestTimeout) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(RequestTimeout(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class SendTimeout implements NetworkExceptions {
  const SendTimeout(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendTimeoutCopyWith<SendTimeout> get copyWith => _$SendTimeoutCopyWithImpl<SendTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTimeout&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.sendTimeout(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $SendTimeoutCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $SendTimeoutCopyWith(SendTimeout value, $Res Function(SendTimeout) _then) = _$SendTimeoutCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$SendTimeoutCopyWithImpl<$Res>
    implements $SendTimeoutCopyWith<$Res> {
  _$SendTimeoutCopyWithImpl(this._self, this._then);

  final SendTimeout _self;
  final $Res Function(SendTimeout) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(SendTimeout(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class RecieveTimeOut implements NetworkExceptions {
  const RecieveTimeOut(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecieveTimeOutCopyWith<RecieveTimeOut> get copyWith => _$RecieveTimeOutCopyWithImpl<RecieveTimeOut>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecieveTimeOut&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.receiveTimeout(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $RecieveTimeOutCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $RecieveTimeOutCopyWith(RecieveTimeOut value, $Res Function(RecieveTimeOut) _then) = _$RecieveTimeOutCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$RecieveTimeOutCopyWithImpl<$Res>
    implements $RecieveTimeOutCopyWith<$Res> {
  _$RecieveTimeOutCopyWithImpl(this._self, this._then);

  final RecieveTimeOut _self;
  final $Res Function(RecieveTimeOut) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(RecieveTimeOut(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class Conflict implements NetworkExceptions {
  const Conflict(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictCopyWith<Conflict> get copyWith => _$ConflictCopyWithImpl<Conflict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.conflict(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $ConflictCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $ConflictCopyWith(Conflict value, $Res Function(Conflict) _then) = _$ConflictCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$ConflictCopyWithImpl<$Res>
    implements $ConflictCopyWith<$Res> {
  _$ConflictCopyWithImpl(this._self, this._then);

  final Conflict _self;
  final $Res Function(Conflict) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(Conflict(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class InternalServerError implements NetworkExceptions {
  const InternalServerError(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternalServerErrorCopyWith<InternalServerError> get copyWith => _$InternalServerErrorCopyWithImpl<InternalServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerError&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.internalServerError(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $InternalServerErrorCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $InternalServerErrorCopyWith(InternalServerError value, $Res Function(InternalServerError) _then) = _$InternalServerErrorCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$InternalServerErrorCopyWithImpl<$Res>
    implements $InternalServerErrorCopyWith<$Res> {
  _$InternalServerErrorCopyWithImpl(this._self, this._then);

  final InternalServerError _self;
  final $Res Function(InternalServerError) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(InternalServerError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class NotImplemented implements NetworkExceptions {
  const NotImplemented(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotImplementedCopyWith<NotImplemented> get copyWith => _$NotImplementedCopyWithImpl<NotImplemented>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotImplemented&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.notImplemented(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $NotImplementedCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $NotImplementedCopyWith(NotImplemented value, $Res Function(NotImplemented) _then) = _$NotImplementedCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$NotImplementedCopyWithImpl<$Res>
    implements $NotImplementedCopyWith<$Res> {
  _$NotImplementedCopyWithImpl(this._self, this._then);

  final NotImplemented _self;
  final $Res Function(NotImplemented) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(NotImplemented(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class ServiceUnavailable implements NetworkExceptions {
  const ServiceUnavailable(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceUnavailableCopyWith<ServiceUnavailable> get copyWith => _$ServiceUnavailableCopyWithImpl<ServiceUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceUnavailable&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.serviceUnavailable(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $ServiceUnavailableCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $ServiceUnavailableCopyWith(ServiceUnavailable value, $Res Function(ServiceUnavailable) _then) = _$ServiceUnavailableCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$ServiceUnavailableCopyWithImpl<$Res>
    implements $ServiceUnavailableCopyWith<$Res> {
  _$ServiceUnavailableCopyWithImpl(this._self, this._then);

  final ServiceUnavailable _self;
  final $Res Function(ServiceUnavailable) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(ServiceUnavailable(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class NoInternetConnection implements NetworkExceptions {
  const NoInternetConnection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.noInternetConnection()';
}


}




/// @nodoc


class FormatException implements NetworkExceptions {
  const FormatException(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormatExceptionCopyWith<FormatException> get copyWith => _$FormatExceptionCopyWithImpl<FormatException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormatException&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.formatException(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $FormatExceptionCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $FormatExceptionCopyWith(FormatException value, $Res Function(FormatException) _then) = _$FormatExceptionCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$FormatExceptionCopyWithImpl<$Res>
    implements $FormatExceptionCopyWith<$Res> {
  _$FormatExceptionCopyWithImpl(this._self, this._then);

  final FormatException _self;
  final $Res Function(FormatException) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(FormatException(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class UnableToProcess implements NetworkExceptions {
  const UnableToProcess(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnableToProcessCopyWith<UnableToProcess> get copyWith => _$UnableToProcessCopyWithImpl<UnableToProcess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnableToProcess&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.unableToProcess(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $UnableToProcessCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $UnableToProcessCopyWith(UnableToProcess value, $Res Function(UnableToProcess) _then) = _$UnableToProcessCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$UnableToProcessCopyWithImpl<$Res>
    implements $UnableToProcessCopyWith<$Res> {
  _$UnableToProcessCopyWithImpl(this._self, this._then);

  final UnableToProcess _self;
  final $Res Function(UnableToProcess) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(UnableToProcess(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class DefaultError implements NetworkExceptions {
  const DefaultError(this.error, this.validation);
  

 final  ErrorModel error;
 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultErrorCopyWith<DefaultError> get copyWith => _$DefaultErrorCopyWithImpl<DefaultError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultError&&(identical(other.error, error) || other.error == error)&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,error,validation);

@override
String toString() {
  return 'NetworkExceptions.defaultError(error: $error, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $DefaultErrorCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $DefaultErrorCopyWith(DefaultError value, $Res Function(DefaultError) _then) = _$DefaultErrorCopyWithImpl;
@useResult
$Res call({
 ErrorModel error, ValidationModel? validation
});




}
/// @nodoc
class _$DefaultErrorCopyWithImpl<$Res>
    implements $DefaultErrorCopyWith<$Res> {
  _$DefaultErrorCopyWithImpl(this._self, this._then);

  final DefaultError _self;
  final $Res Function(DefaultError) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? validation = freezed,}) {
  return _then(DefaultError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class UnexpectedError implements NetworkExceptions {
  const UnexpectedError(this.validation);
  

 final  ValidationModel? validation;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedErrorCopyWith<UnexpectedError> get copyWith => _$UnexpectedErrorCopyWithImpl<UnexpectedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedError&&(identical(other.validation, validation) || other.validation == validation));
}


@override
int get hashCode => Object.hash(runtimeType,validation);

@override
String toString() {
  return 'NetworkExceptions.unexpectedError(validation: $validation)';
}


}

/// @nodoc
abstract mixin class $UnexpectedErrorCopyWith<$Res> implements $NetworkExceptionsCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(UnexpectedError value, $Res Function(UnexpectedError) _then) = _$UnexpectedErrorCopyWithImpl;
@useResult
$Res call({
 ValidationModel? validation
});




}
/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(this._self, this._then);

  final UnexpectedError _self;
  final $Res Function(UnexpectedError) _then;

/// Create a copy of NetworkExceptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? validation = freezed,}) {
  return _then(UnexpectedError(
freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationModel?,
  ));
}


}

/// @nodoc


class LocationServiceException implements NetworkExceptions {
  const LocationServiceException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationServiceException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.locationServiceException()';
}


}




/// @nodoc


class LocationPermissionException implements NetworkExceptions {
  const LocationPermissionException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPermissionException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkExceptions.locationPermissionException()';
}


}




// dart format on
