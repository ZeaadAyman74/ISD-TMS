import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';

class ProjectRolesResponse {
  final List<ProjectRoleModel> roles;

  ProjectRolesResponse({required this.roles});

  factory ProjectRolesResponse.fromJson(Map<String, dynamic> json) {
    return ProjectRolesResponse(
      roles: json['data'] != null
          ? List.from(json['data'].map((e) => ProjectRoleModel.fromJson(e)))
          : [],
    );
  }
}

class ProjectRoleModel {
  final String value;
  final String labelEn;
  final String labelAr;
  final String descriptionEn;
  final String descriptionAr;
  final String color;

  ProjectRoleModel({
    required this.value,
    required this.labelEn,
    required this.labelAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.color,
  });

  factory ProjectRoleModel.fromJson(Map<String, dynamic> json) {
    return ProjectRoleModel(
      value: json['value'],
      labelEn: json['label'] ?? json['label_ar'] ?? '',
      labelAr: json['label_ar'],
      descriptionEn: json['description'] ?? json['description_ar'] ?? '',
      descriptionAr: json['description_ar'] ?? json['description_ar'] ?? '',
      color: json['color'],
    );
  }

  String get label => SharedPrefUtils.locale == 'en' ? labelEn : labelAr;

  String get description =>
      SharedPrefUtils.locale == 'en' ? descriptionEn : descriptionAr;
}
