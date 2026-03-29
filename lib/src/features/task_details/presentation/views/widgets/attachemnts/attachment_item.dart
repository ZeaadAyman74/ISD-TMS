import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';

class AttachmentItem extends StatelessWidget {
  const AttachmentItem({
    super.key,
    required this.attachment,
    required this.onDelete,
  });

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
