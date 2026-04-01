import 'package:isd_tms/src/features/projects/data/models/base_permission_model.dart';


class ProjectPermissionsModel {
  final BasePermissions? projects;
  final BasePermissions? lists;
  final BasePermissions? cards;
  final BasePermissions? cardAssignees;
  final BasePermissions? cardFollowers;
  final BasePermissions? cardComments;
  final BasePermissions? cardAttachments;
  final BasePermissions? labels;
  final BasePermissions? cardLabels;
  final BasePermissions? activities;
  final BasePermissions? projectMembers;
  final BasePermissions? sprints;

  ProjectPermissionsModel({this.projects, this.lists, this.cards,
    this.cardAssignees, this.cardFollowers, this.cardComments,
    this.cardAttachments, this.labels, this.cardLabels, this.activities,
    this.projectMembers,this.sprints});

  factory ProjectPermissionsModel.fromJson(Map<String,dynamic>json){
    return ProjectPermissionsModel(
      projects: BasePermissions.fromJson(json['projects']),
      projectMembers: BasePermissions.fromJson(json['project_members']),
      lists: BasePermissions.fromJson(json['lists']),
      labels: BasePermissions.fromJson(json['labels']),
      cards: BasePermissions.fromJson(json['cards']),
      cardLabels: BasePermissions.fromJson(json['card_labels']),
      cardFollowers: BasePermissions.fromJson(json['card_followers']),
      cardComments: BasePermissions.fromJson(json['card_comments']),
      cardAttachments: BasePermissions.fromJson(json['card_attachments']),
      cardAssignees: BasePermissions.fromJson(json['card_assignees']),
      activities: BasePermissions.fromJson(json['activities']),
      sprints: BasePermissions.fromJson(json['sprints']),
    );
  }


}