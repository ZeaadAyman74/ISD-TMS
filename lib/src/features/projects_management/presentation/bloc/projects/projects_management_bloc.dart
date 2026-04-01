import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'projects_management_event.dart';
part 'projects_management_state.dart';

class ProjectsManagementBloc extends Bloc<ProjectsManagementEvent, ProjectsManagementState> {
  ProjectsManagementBloc() : super(ProjectsManagementInitial()) {
    on<ProjectsManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
