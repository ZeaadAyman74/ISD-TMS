import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/attachemnts/attachment_section.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/description_field.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/title_field.dart';

class TaskDetailLeftSection extends StatelessWidget {
  const TaskDetailLeftSection({super.key,});

  @override
  Widget build(BuildContext context) {
    BoardCubit  boardCubit=context.read<BoardCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const TitleField(),
        16.verticalSpace,
        const DescriptionField(),
        if( boardCubit.permissions?.cardAttachments?.show ??false)
        24.verticalSpace,
        const AttachmentSection(),
      ],
    );
  }
}

