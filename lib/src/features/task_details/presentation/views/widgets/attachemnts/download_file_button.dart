import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';

class DownloadFileButton extends StatelessWidget {
  const DownloadFileButton({super.key, required this.attachment});

  final TaskAttachmentModel attachment;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskDetailsCubit>();
    return BlocBuilder(
      bloc: cubit,
      buildWhen: (previous, current) =>
          (current is DownloadInProgress &&
              current.attachmentId == attachment.id) ||
          (current is DownloadFailure &&
              current.attachmentId == attachment.id) ||
          (current is DownloadSuccess && current.attachmentId == attachment.id),
      builder: (context, state) {
        if(state is DownloadInProgress){
          return SizedBox(
            height: 25.w,
            width: 25.w,
            child: CircularProgressIndicator(
              color: context.themeData.primaryColor,
              value: state.progress,
            ),
          );
        }
        return IconButton(
          onPressed: () {
            context.read<TaskDetailsCubit>().startDownloadFile(
              id: attachment.id,
              fileName: attachment.fileName,
              url: attachment.downloadUrl,
            );
          },
          icon: const Icon(Icons.download_outlined, size: 18),
        );
      },
    );
  }
}
