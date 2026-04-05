import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/widgets/cached_image.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';

class AttachmentIcon extends StatelessWidget {
  const AttachmentIcon({super.key, required this.attachment});

  final TaskAttachmentModel attachment;

  @override
  Widget build(BuildContext context) {
    final isImage = attachment.mimeType.toLowerCase().startsWith('image/');
    if (isImage && attachment.previewUrl != null) {
      return CachedImage(
        url: attachment.previewUrl!,
        width: 40.w,
        height: 40.w,
        radius: 4.r,
        errorWidget: Icon(
          Icons.image,
          size: 32.sp,
          color: AppColors.textSecondary,
        ),
      );
    } else {
      return Icon(
        Icons.insert_drive_file,
        size: 32.sp,
        color: AppColors.textSecondary,
      );
    }
  }
}
