import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/attachemnts/attachment_item.dart';

class AttachmentSection extends StatelessWidget {
  const AttachmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskDetailsCubit>();
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      buildWhen: (previous, current) =>
          current is GetAttachmentsSuccess ||
          current is GetAttachmentsError ||
          current is GetAttachmentsLoading ||
          current is DeleteAttachmentSuccess,
      builder: (context, state) {
        if (state is GetAttachmentsLoading) {
          return const AppLoading();
        }
        if (state is GetAttachmentsError) {
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
            color: context.appColors.secondaryBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
            shape: const Border(),
            title: Row(
              children: [
                Text(
                  'Attachments',
                  style: context.appTextTheme.font14TextPrimarySemiBold
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 8.w),
                _CountChip(count: cubit.attachments.length),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  onPressed: () => _pickAndUpload(context),
                  icon: const Icon(Icons.upload, size: 16),
                  label: const Text('Upload'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    minimumSize: Size.zero,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, size: 24.sp),
              ],
            ),
            children: [
              BlocBuilder(
                buildWhen: (previous, current) =>
                    current is UploadAttachmentLoading ||
                    current is UploadAttachmentSuccess ||
                    current is UploadAttachmentError,
                builder: (context, state) {
                  if (state is UploadAttachmentLoading) {
                    return const LinearProgressIndicator();
                  }
                  return const SizedBox.shrink();
                },
              ),
              ...cubit.attachments.map(
                (a) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AttachmentItem(
                    attachment: a,
                    onDelete: () =>
                        context.read<TaskDetailsCubit>().deleteAttachment(a.id),
                  ),
                ),
              ),
              if (cubit.attachments.isNotEmpty) SizedBox(height: 8.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAndUpload(BuildContext context) async {
    final cubit = context.read<TaskDetailsCubit>();
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      if (context.mounted) {
        cubit.uploadAttachment(result.files.single.path!);
      }
    }
  }
}

class _CountChip extends StatelessWidget {
  const _CountChip({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        '$count',
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
