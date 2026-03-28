import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:file_picker/file_picker.dart';

class AttachmentSection extends StatelessWidget {
  const AttachmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      builder: (context, state) {
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
                _CountChip(count: state.attachments.length),
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
              if (state.status == TaskDetailsStatus.uploadingAttachment)
                const LinearProgressIndicator(),
              ...state.attachments.map(
                (a) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: _AttachmentItem(
                    attachment: a,
                    onDelete: () => context
                        .read<TaskDetailsCubit>()
                        .deleteAttachment( a.id),
                  ),
                ),
              ),
              if (state.attachments.isNotEmpty) SizedBox(height: 8.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAndUpload(BuildContext context) async {
    final cubit=context.read<TaskDetailsCubit>();
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      if (context.mounted) {
        cubit.uploadAttachment(
          result.files.single.path!,
        );
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

class _AttachmentItem extends StatelessWidget {
  const _AttachmentItem({required this.attachment, required this.onDelete});

  final dynamic attachment;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final isImage = attachment.mimeType.toLowerCase().startsWith('image/');

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          if (isImage &&
              attachment.previewUrl != null &&
              attachment.previewUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.network(
                attachment.previewUrl!,
                width: 40.w,
                height: 40.w,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.image,
                  size: 32.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            )
          else
            Icon(
              Icons.insert_drive_file,
              size: 32.sp,
              color: AppColors.textSecondary,
            ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attachment.fileName,
                  style: context.appTextTheme.font14TextPrimarySemiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${(attachment.size / 1024).toStringAsFixed(1)} KB',
                  style: context.appTextTheme.font11TextSecondaryRegular,
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     // Download attachment
          //   },
          //   icon: const Icon(Icons.download_outlined, size: 18),
          // ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline,
              size: 18,
              color: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
