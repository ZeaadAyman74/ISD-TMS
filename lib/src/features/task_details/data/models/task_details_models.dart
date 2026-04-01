import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';

class LookupModel {
  const LookupModel({
    required this.key,
    required this.labelEn,
    required this.labelAr,
    required this.color,
    required this.icon,
    this.order,
  });

  final String key;
  final String labelEn;
  final String labelAr;
  final String color;
  final String icon;
  final int? order;

  factory LookupModel.fromJson(Map<String, dynamic> json) {
    return LookupModel(
      key: json['key'] ?? '',
      labelEn: json['label'] ?? '',
      labelAr: json['label_ar'] ?? '',
      color: json['color'] ?? '#000000',
      icon: json['icon'] ?? '',
      order: json['order'],
    );
  }

  String get label => SharedPrefUtils.locale=='en'?labelEn:labelAr;
}
