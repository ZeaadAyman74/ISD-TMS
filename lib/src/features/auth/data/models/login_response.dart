import 'package:isd_tms/src/features/auth/data/models/user_model.dart';

class LoginResponse {
  const LoginResponse({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.user,
    this.userId,
  });

  final String? tokenType;
  final String? accessToken;
  final int? expiresIn;
  final UserModel? user;
  final int? userId;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    if (data == null) return const LoginResponse();

    UserModel? user;
    if (data['user'] != null && data['user']['data'] != null) {
      user = UserModel.fromJson(data['user']['data']);
    }

    return LoginResponse(
      tokenType: data['token_type'],
      accessToken: data['access_token'],
      expiresIn: data['expires_in'],
      user: user,
      userId: data['user_id'],
    );
  }
}
