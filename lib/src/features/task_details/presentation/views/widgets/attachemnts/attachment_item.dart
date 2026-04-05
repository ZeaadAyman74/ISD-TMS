import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/attachemnts/attachment_icon.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/attachemnts/delete_attachment_button.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/attachemnts/download_file_button.dart';

class AttachmentItem extends StatelessWidget {
  const AttachmentItem({
    super.key,
    required this.attachment,
    this.canDelete = true,
  });

  final TaskAttachmentModel attachment;
  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          AttachmentIcon(attachment: attachment),
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
          DownloadFileButton(attachment: attachment),
          if (canDelete) DeleteAttachmentButton(attachment: attachment),
        ],
      ),
    );
  }
}
