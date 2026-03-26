class ProjectOwner {
  const ProjectOwner({
    required this.id,
    required this.fullName,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isActive = 1,
    this.photoThumbXsUrl,
  });

  final int id;
  final String fullName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? emailVerifiedAt;
  final String? photoUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int isActive;
  final String? photoThumbXsUrl;

  factory ProjectOwner.fromJson(Map<String, dynamic> json) {
    return ProjectOwner(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      photoUrl: json['photo_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      isActive: json['is_active'] ?? 1,
      photoThumbXsUrl: json['photo_thumb_xs_url'],
    );
  }
}
