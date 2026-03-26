class ProjectMember {
  const ProjectMember({
    required this.id,
    this.projectId,
    this.userId,
    required this.role,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.searchText,
  });

  final int id;
  final int? projectId;
  final int? userId;
  final String role;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? searchText;

  factory ProjectMember.fromJson(Map<String, dynamic> json) {
    return ProjectMember(
      id: json['id'] ?? 0,
      projectId: json['project_id'],
      userId: json['user_id'],
      role: json['role'] ?? 'member',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      searchText: json['search_text'],
    );
  }
}
