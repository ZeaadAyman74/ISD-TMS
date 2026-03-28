import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';

class TaskUtils {
 static Color getPriorityColor(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high':
        return AppColors.highPriority;
      case 'medium':
        return AppColors.mediumPriority;
      case 'low':
        return AppColors.lowPriority;
      default:
        return AppColors.textSecondary;
    }
  }

 static IconData getPriorityIcon(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high':
        return Icons.keyboard_double_arrow_up;
      case 'medium':
        return Icons.trending_flat;
      case 'low':
        return Icons.keyboard_double_arrow_down;
      default:
        return Icons.flag;
    }
  }


 static Color  getTypeColor(String? type) {
    switch (type?.toLowerCase()) {
      case 'task':
        return AppColors.taskColor;
      case 'bug':
        return AppColors.bugColor;
      case 'story':
        return AppColors.storyColor;
      case 'improvement':
        return AppColors.improvementColor;
      default:
        return AppColors.primary;
    }
  }


 static IconData  getTypeIcon(String? type) {
    switch (type?.toLowerCase()) {
      case 'task':
        return Icons.check_box_outlined;
      case 'bug':
        return Icons.bug_report_outlined;
      case 'story':
        return Icons.book_outlined;
      case 'improvement':
        return Icons.trending_up;
      default:
        return Icons.task_alt;
    }
  }

}