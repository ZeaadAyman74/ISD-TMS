import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';
import 'package:isd_tms/src/features/auth/data/models/login_dto.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(EndPoints.login)
  Future<HttpResponse<dynamic>> login(@Body() LoginDTO body);

  @GET(EndPoints.authCheck)
  Future<HttpResponse<dynamic>> checkAuth();

  @POST(EndPoints.logout)
  Future<HttpResponse<dynamic>> logout();
}
