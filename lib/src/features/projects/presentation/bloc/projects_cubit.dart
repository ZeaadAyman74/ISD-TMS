import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';
import 'package:isd_tms/src/features/projects/data/repo/projects_repo.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit(this._repo) : super(const ProjectsInitial());
  final ProjectsRepo _repo;

  List<ProjectModel> projects = [];

  Future<void> getProjects() async {
    emit(const ProjectsLoading());
    final result = await _repo.getMyProjects();

    result.when(
      success: (data) {
        projects = data.data;
        emit(ProjectsLoaded(projects));
      },
      failure: (error) {
        emit(ProjectsError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }
}
