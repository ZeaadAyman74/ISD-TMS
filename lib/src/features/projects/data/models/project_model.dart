import 'package:isd_tms/src/features/projects/data/models/project_member_model.dart';
import 'package:isd_tms/src/features/projects/data/models/project_owner_model.dart';

class ProjectModel {
  const ProjectModel({
    required this.id,
    required this.name,
    this.description,
    this.ownerId,
    this.createdBy,
    this.useSprints,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.searchText,
    this.isActive = 1,
    this.owner,
    this.members,
    this.currentMember,
    // this.permissions,
  });

  final int id;
  final String name;
  final String? description;
  final int? ownerId;
  final int? createdBy;
  final int? useSprints;
  final String? archivedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? searchText;
  final int isActive;
  final ProjectOwner? owner;
  final List<ProjectMember>? members;
  final ProjectMember? currentMember;
  // final ProjectPermissionsModel? permissions;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'],
      ownerId: json['owner_id'],
      createdBy: json['created_by'],
      useSprints: json['use_sprints'],
      archivedAt: json['archived_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      searchText: json['search_text'],
      isActive: json['is_active'] ?? 1,
      owner: json['owner'] != null
          ? ProjectOwner.fromJson(json['owner'] as Map<String, dynamic>)
          : null,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => ProjectMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentMember: json['current_member'] != null
          ? ProjectMember.fromJson(
              json['current_member'] as Map<String, dynamic>,
            )
          : null,
      // permissions: json['permissions'] != null
      //     ? ProjectPermissionsModel.fromJson(json['permissions'])
      //     : null,
    );
  }
}
