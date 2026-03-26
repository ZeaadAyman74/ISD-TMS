class AuthCheckResponse {
  const AuthCheckResponse({required this.authenticated});

  final bool authenticated;

  factory AuthCheckResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return AuthCheckResponse(
      authenticated: data?['authenticated'] ?? false,
    );
  }
}
