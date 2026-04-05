import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class DeleteAttachmentButton extends StatelessWidget {
  const DeleteAttachmentButton({super.key, required this.attachment});

  final TaskAttachmentModel attachment;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<TaskDetailsCubit>().deleteAttachment(attachment.id);
      },
      icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.error),
    );
  }
}
