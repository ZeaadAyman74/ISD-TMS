import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/card_details/card_details_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class AttachmentSection extends StatelessWidget {
  const AttachmentSection({super.key, required this.projectId, required this.cardId});

  final int projectId;
  final int cardId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardDetailsCubit, CardDetailsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Attachments',
                  style: context.appTextTheme.font11TextSecondaryRegular.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(width: 8.w),
                _CountChip(count: state.attachments.length),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _pickAndUpload(context),
                  icon: const Icon(Icons.upload, size: 16),
                  label: const Text('Upload'),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            if (state.status == CardDetailsStatus.uploadingAttachment)
             const LinearProgressIndicator(),
            ...state.attachments.map((a) => _AttachmentItem(
              attachment: a,
              onDelete: () => context.read<CardDetailsCubit>().deleteAttachment(projectId, cardId, a.id),
            )),
          ],
        );
      },
    );
  }

  Future<void> _pickAndUpload(BuildContext context) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      context.read<CardDetailsCubit>().uploadAttachment(projectId, cardId, file.path);
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
        color: context.appColors.secondaryBackground,
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
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.appColors.secondaryBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file, size: 24.sp, color: AppColors.textSecondary),
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
          IconButton(
            onPressed: () {
               // Download attachment 
            },
            icon: const Icon(Icons.download_outlined, size: 18),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.error),
          ),
        ],
      ),
    );
  }
}
