import 'package:isd_tms/src/features/task_details/data/models/task_attachments/task_attachment_model.dart';

class UploadAttachmentResponse {
  final TaskAttachmentModel attachment;

  UploadAttachmentResponse({required this.attachment});

  factory UploadAttachmentResponse.fromJson(Map<String,dynamic>json){
    return UploadAttachmentResponse(attachment: TaskAttachmentModel.fromJson(json['data']));
  }
}