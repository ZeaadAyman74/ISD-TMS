import 'package:hive_ce/hive.dart';
import 'package:isd_tms/src/features/auth/data/models/permission_model.dart';

part 'role_model.g.dart';

@HiveType(typeId: 2)
class RoleModel extends HiveObject {
  RoleModel({
    required this.id,
    required this.name,
    required this.permissions,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<PermissionModel> permissions;

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      permissions: (json['permissions'] as List?)
              ?.map((e) => PermissionModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'permissions': permissions.map((e) => e.toJson()).toList(),
      };
}
