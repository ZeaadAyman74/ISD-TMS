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
  String get email_label => 'البريد الإلكتروني أو رقم الامتداد';

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
}
