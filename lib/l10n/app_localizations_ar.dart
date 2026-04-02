// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get app_title => 'نظام إدارة المهام';

  @override
  String get initial_page => 'الصفحة الرئيسية';

  @override
  String get welcome_title => 'أهلاً بك في نظام إدارة المهام! 👋';

  @override
  String get welcome_subtitle => 'يرجى تسجيل الدخول إلى حسابك وبدء المغامرة';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email_label => 'البريد الإلكتروني';

  @override
  String get email_hint => 'أدخل بريدك الإلكتروني';

  @override
  String get password_label => 'كلمة المرور';

  @override
  String get password_hint => 'أدخل كلمة المرور';

  @override
  String get email_required => 'البريد الإلكتروني مطلوب';

  @override
  String get invalid_email => 'البريد الإلكتروني غير صالح';

  @override
  String get password_required => 'كلمة المرور مطلوبة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get dashboard => 'لوحة القيادة';

  @override
  String get my_projects => 'مشاريعي';

  @override
  String get no_projects_found => 'لم يتم العثور على مشاريع';

  @override
  String get board_view => 'عرض اللوحة';

  @override
  String get task_created_success => 'تم إنشاء المهمة بنجاح';

  @override
  String get no_board_columns => 'لم يتم العثور على أعمدة للوحة';

  @override
  String get add_task => 'إضافة مهمة';

  @override
  String get create_new_task => 'إنشاء مهمة جديدة';

  @override
  String get task_title => 'عنوان المهمة';

  @override
  String get enter_task_title => 'أدخل عنوان المهمة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get create => 'إنشاء';

  @override
  String get owner_label => 'المالك: ';

  @override
  String get adding_to => 'إضافة إلى: ';

  @override
  String get just_now => 'الآن';

  @override
  String get minute_ago => 'دقيقة مضت';

  @override
  String get minutes_ago => 'دقائق مضت';

  @override
  String get hour_ago => 'ساعة مضت';

  @override
  String get hours_ago => 'ساعات مضت';

  @override
  String get task_details => 'تفاصيل المهمة';

  @override
  String get task_updated_success => 'تم تحديث المهمة بنجاح';

  @override
  String get description => 'الوصف';

  @override
  String get due_date => 'تاريخ الاستحقاق';

  @override
  String get assignees => 'المكلفون';

  @override
  String get labels => 'التصنيفات';

  @override
  String get comment_count => 'تعليقات';

  @override
  String get created_at_prefix => 'تم الإنشاء: ';

  @override
  String get edit_task => 'تعديل المهمة';

  @override
  String get title => 'العنوان';

  @override
  String get update => 'تحديث';

  @override
  String get updated_the_card => 'قام بتحديث المهمة';

  @override
  String get created_card => 'قام بإنشاء المهمة';

  @override
  String get uploaded_attachment => 'قام برفع مرفق';

  @override
  String get deleted_attachment => 'قام بحذف المرفق';

  @override
  String get change_the_assignee => 'قام بتغيير المسؤول';

  @override
  String get moved_the_card => 'قام بنقل المهمة';

  @override
  String get type => 'النوع';

  @override
  String get priority => 'الاولوية';

  @override
  String get status => 'الحالة';

  @override
  String get attachments => 'المرفقات';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get save => 'حفظ';

  @override
  String get upload => 'تحميل';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get no_notifications => 'لا يوجد إشعارات بعد';

  @override
  String get are_you_sure_delete_task => 'هل أنت متأكد من حذف هذه المهمة؟';

  @override
  String get task_deleted_success => 'تم حذف المهمة بنجاح';

  @override
  String get delete_task => 'حذف المهمة';

  @override
  String get delete => 'حذف';

  @override
  String comments_tab(int count) {
    return 'التعليقات ($count)';
  }

  @override
  String get history_tab => 'السجل';

  @override
  String get comments => 'التعليقات';

  @override
  String get add_comment_hint => 'إضافة تعليق...';

  @override
  String get search_cards_hint => 'البحث في البطاقات...';

  @override
  String get add_description_hint => 'إضافة وصف...';

  @override
  String get assign_members => 'تعيين أعضاء';

  @override
  String get assigned_label => 'تم التعيين';

  @override
  String get not_set => 'غير محدد';

  @override
  String get notification_moved => 'نقل';

  @override
  String get notification_mention => 'إشارة';

  @override
  String get notification_assigned => 'تعيين';

  @override
  String get notification_comment => 'تعليق';

  @override
  String get notification_project_owner => 'مالك المشروع';

  @override
  String get notification_member_added => 'إضافة عضو';

  @override
  String get notification_default => 'إشعار';

  @override
  String get admin_user => 'المدير';

  @override
  String get ok => 'موافق';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get language => 'اللغة';

  @override
  String get projects_management => 'Projects Management';

  @override
  String get you => 'انت';

  @override
  String get add => 'إضافة';

  @override
  String get add_member => 'إضافة عضو';

  @override
  String get role => 'الدور';

  @override
  String get no_members_found => 'لا يوجد أعضاء';

  @override
  String get failed_to_load_members => 'فشل في تحميل الأعضاء';

  @override
  String get select_role => 'اختر الدور';

  @override
  String members_screen_title(String projectName) {
    return 'أعضاء $projectName';
  }

  @override
  String remove_member_confirmation(String memberName) {
    return 'هل أنت متأكد أنك تريد إزالة $memberName من هذا المشروع؟';
  }

  @override
  String get role_changed_successfully => 'تم تغيير الدور بنجاح';

  @override
  String get member_removed_successfully => 'تمت إزالة العضو بنجاح';

  @override
  String get ownership_transferred_successfully => 'تم نقل الملكية بنجاح';

  @override
  String get no_email => 'لا يوجد بريد إلكتروني';

  @override
  String get member_role_chip => 'عضو';

  @override
  String get transfer_ownership => 'نقل الملكية';

  @override
  String get transfer_ownership_critical_warning =>
      'هذا إجراء حرج لا يمكن التراجع عنه بسهولة';

  @override
  String get transfer_ownership_description =>
      'أنت على وشك نقل ملكية المشروع. سيصبح المالك الحالي مديراً، وسيصبح العضو المختار هو المالك الجديد مع تحكم كامل.';

  @override
  String get select_new_owner => 'اختر المالك الجديد';

  @override
  String get transfer => 'نقل';

  @override
  String get member_added_successfully => 'تم إضافة العضو بنجاح';
}
