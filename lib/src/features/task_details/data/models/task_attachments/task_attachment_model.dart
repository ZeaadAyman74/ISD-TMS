import 'package:isd_tms/src/features/board/data/models/board_models.dart';

class TaskAttachmentsResponse {
  final List<TaskAttachmentModel> attachments;

  TaskAttachmentsResponse({required this.attachments});

  factory TaskAttachmentsResponse.fromJson(Map<String, dynamic> json) {
    return TaskAttachmentsResponse(
      attachments: json['data'] != null
          ? List.from(json['data'].map((e) => TaskAttachmentModel.fromJson(e)))
          : [],
    );
  }
}

class TaskAttachmentModel {
  const TaskAttachmentModel({
    required this.id,
    required this.cardId,
    required this.fileName,
    required this.filePath,
    required this.mimeType,
    required this.size,
    required this.createdAt,
    required this.previewUrl,
    required this.downloadUrl,
    this.user,
  });

  final int id;
  final int cardId;
  final String fileName;
  final String filePath;
  final String mimeType;
  final int size;
  final String createdAt;
  final String? previewUrl;
  final String downloadUrl;
  final BoardMember? user;

  factory TaskAttachmentModel.fromJson(Map<String, dynamic> json) {
    return TaskAttachmentModel(
      id: json['id'] ?? 0,
      cardId: json['card_id'] ?? 0,
      fileName: json['file_name'] ?? '',
      filePath: json['file_path'] ?? '',
      mimeType: json['mime_type'] ?? '',
      size: json['size'] ?? 0,
      createdAt: json['created_at'] ?? '',
      previewUrl: json['preview_url'] ?? '',
      downloadUrl: json['download_url'] ?? '',
      user: json['user'] != null ? BoardMember.fromJson(json['user']) : null,
    );
  }
}
