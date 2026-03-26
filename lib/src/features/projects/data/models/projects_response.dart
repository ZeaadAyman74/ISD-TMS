import 'package:isd_tms/src/features/projects/data/models/project_model.dart';

class ProjectsResponse {
  ProjectsResponse({
    required this.data,
    this.meta,
  });

  final List<ProjectModel> data;
  final dynamic meta;

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ProjectsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      meta: json['meta'],
    );
  }
}