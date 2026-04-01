import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/core/widgets/error_state_widget.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/activity/activity_list.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView>with AutomaticKeepAliveClientMixin {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();

  @override
  void initState() {
    super.initState();
    if(cubit.currentProject!.permissions?.activities?.show??false){
      cubit.getHistory();
    }
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is GetHistorySuccess ||
          current is GetHistoryLoading ||
          current is GetHistoryError,
      builder: (context, state) {
        if(state is GetHistoryLoading){
          return const AppLoading();
        }
        if(state is GetHistoryError){
          return ErrorStateWidget(message: state.error);
        }
        return  ActivityList(activities: cubit.activities,);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
