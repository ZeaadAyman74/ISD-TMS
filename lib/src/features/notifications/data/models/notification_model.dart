import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';
import 'package:isd_tms/src/core/utils/app_date_formater.dart';

class NotificationsResponse {
  final List<NotificationModel> notifications;
  final NotificationMeta? meta;

  NotificationsResponse({required this.notifications, this.meta});

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) {
    return NotificationsResponse(
      notifications: json['data'] != null
          ? List.from(json['data'].map((e) => NotificationModel.fromJson(e)))
          : [],
      meta: json['meta'] != null
          ? NotificationMeta.fromJson(json['meta'])
          : null,
    );
  }
}

//-----------------------------------------------------------------------

class NotificationMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const NotificationMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory NotificationMeta.fromJson(Map<String, dynamic> json) {
    return NotificationMeta(
      currentPage: json['current_page'] ?? 1,
      lastPage: json['last_page'] ?? 1,
      perPage: json['per_page'] ?? 15,
      total: json['total'] ?? 0,
    );
  }
}

//-----------------------------------------------------------------------

enum NotificationType {
  cardMoved,
  cardMention,
  cardAssigned,
  cardComment,
  projectOwnerAssigned,
  projectMemberAdded,
  unknown;

  static NotificationType fromString(String type) {
    switch (type) {
      case 'card.moved':
        return NotificationType.cardMoved;
      case 'card.mention':
        return NotificationType.cardMention;
      case 'card.assigned':
        return NotificationType.cardAssigned;
      case 'card.comment':
        return NotificationType.cardComment;
      case 'project.owner_assigned':
        return NotificationType.projectOwnerAssigned;
      case 'project.member_added':
        return NotificationType.projectMemberAdded;
      default:
        return NotificationType.unknown;
    }
  }

  String get label {
    switch (this) {
      case NotificationType.cardMoved:
        return 'Moved';
      case NotificationType.cardMention:
        return 'Mention';
      case NotificationType.cardAssigned:
        return 'Assigned';
      case NotificationType.cardComment:
        return 'Comment';
      case NotificationType.projectOwnerAssigned:
        return 'Project Owner';
      case NotificationType.projectMemberAdded:
        return 'Member Added';
      case NotificationType.unknown:
        return 'Notification';
    }
  }
}

//-----------------------------------------------------------------------

class NotificationModel {
  const NotificationModel({
    required this.id,
    required this.type,
    required this.label,
    required this.description,
    required this.icon,
    required this.category,
    required this.isRead,
    required this.createdAt,
    this.data,
  });

  final int id;
  final NotificationType type;
  final String label;
  final String description;
  final String icon;
  final String category;
  final bool isRead;
  final String createdAt;
  final NotificationData? data;

  String get formattedDate {
    return AppDateFormatter.dateStringToFormat(createdAt, 'MMM d');
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      type: NotificationType.fromString(json['type'] ?? ''),
      label: json['label'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      category: json['category'] ?? '',
      isRead: json['is_read'] == true || json['is_read'] == 1,
      createdAt: json['created_at'] ?? '',
      data: json['data'] != null
          ? NotificationData.fromJson(json['data'])
          : null,
    );
  }
}

//-----------------------------------------------------------------------

class NotificationData {
  const NotificationData({
    this.actorName,
    this.actorAvatar,
    this.actorId,
    this.projectId,
    this.cardId,
    this.card,
    this.project,
    this.extra,
    this.messageEn,
    this.messageAr,
  });

  final String? messageEn;
  final String? messageAr;
  final String? actorName;
  final String? actorAvatar;
  final int? actorId;
  final int? projectId;
  final int? cardId;
  final NotificationCardModel? card;
  final NotificationProject? project;
  final NotificationExtra? extra;

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      actorName: json['actor_name'],
      actorAvatar: json['actor_avatar'],
      actorId: json['actor_id'],
      projectId: json['project_id'],
      cardId: json['card_id'],
      card: json['card'] != null
          ? NotificationCardModel.fromJson(json['card'])
          : null,
      project: json['project'] != null
          ? NotificationProject.fromJson(json['project'])
          : null,
      extra: json['extra'] != null
          ? NotificationExtra.fromJson(json['extra'])
          : null,
      messageEn: json['translations']['en']['message']??json['message'],
      messageAr: json['translations']['ar']['message']??json['message'],
    );
  }

  String? get message => SharedPrefUtils.locale=='ar'?messageAr:messageEn;
}

//-----------------------------------------------------------------------

class NotificationCardModel {
  const NotificationCardModel({required this.id, this.code, this.title});

  final int id;
  final String? code;
  final String? title;

  factory NotificationCardModel.fromJson(Map<String, dynamic> json) {
    return NotificationCardModel(
      id: json['id'] ?? 0,
      code: json['code'],
      title: json['title'],
    );
  }
}

//-----------------------------------------------------------------------

class NotificationProject {
  const NotificationProject({required this.id, required this.name});

  final int id;
  final String name;

  factory NotificationProject.fromJson(Map<String, dynamic> json) {
    return NotificationProject(id: json['id'] ?? 0, name: json['name'] ?? '');
  }
}

//-----------------------------------------------------------------------

class NotificationExtra {
  const NotificationExtra({this.toList, this.fromList, this.commentId});

  final String? toList;
  final String? fromList;
  final int? commentId;

  factory NotificationExtra.fromJson(Map<String, dynamic> json) {
    return NotificationExtra(
      toList: json['to_list'],
      fromList: json['from_list'],
      commentId: json['comment_id'],
    );
  }
}
