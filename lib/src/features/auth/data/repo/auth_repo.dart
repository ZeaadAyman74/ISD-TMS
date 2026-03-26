import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/features/auth/data/models/auth_check_response.dart';
import 'package:isd_tms/src/features/auth/data/models/login_dto.dart';
import 'package:isd_tms/src/features/auth/data/models/login_response.dart';
import 'package:isd_tms/src/features/auth/data/service/auth_service.dart';

class AuthRepo {
  const AuthRepo(this._service);
  final AuthService _service;

  Future<NetworkResult<LoginResponse>> login(LoginDTO body) async {
    try {
      final response = await _service.login(body);
      return NetworkResult.success(LoginResponse.fromJson(response.data));
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<AuthCheckResponse>> checkAuth() async {
    try {
      final response = await _service.checkAuth();
      return NetworkResult.success(AuthCheckResponse.fromJson(response.data));
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<NetworkResult<dynamic>> logout() async {
    try {
      final response = await _service.logout();
      return NetworkResult.success(response.data);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
