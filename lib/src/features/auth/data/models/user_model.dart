import 'package:hive_ce/hive.dart';
import 'package:isd_tms/src/features/auth/data/models/role_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.email,
    this.isActive = 1,
    this.photoUrl,
    this.photoThumbMdUrl,
    this.photoThumbXsUrl,
    this.roles = const [],
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String fullName;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final int isActive;

  @HiveField(6)
  final String? photoUrl;

  @HiveField(7)
  final String? photoThumbMdUrl;

  @HiveField(8)
  final String? photoThumbXsUrl;

  @HiveField(9)
  final List<RoleModel> roles;

  factory UserModel.fromJson(Map<String, dynamic> json, {List<RoleModel> roles = const []}) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      isActive: json['is_active'] ?? 1,
      photoUrl: json['photo_url'],
      photoThumbMdUrl: json['photo_thumb_md_url'],
      photoThumbXsUrl: json['photo_thumb_xs_url'],
      roles: roles,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'full_name': fullName,
        'email': email,
        'is_active': isActive,
        'photo_url': photoUrl,
        'photo_thumb_md_url': photoThumbMdUrl,
        'photo_thumb_xs_url': photoThumbXsUrl,
        'roles': roles.map((e) => e.toJson()).toList(),
      };
}

