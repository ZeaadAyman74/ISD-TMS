class AddMemberRequestModel {
  final String role;
  final int userId;

  AddMemberRequestModel({required this.role, required this.userId});

  Map<String, dynamic> toJson() {
    return {'role': role, 'user_id': userId};
  }
}
