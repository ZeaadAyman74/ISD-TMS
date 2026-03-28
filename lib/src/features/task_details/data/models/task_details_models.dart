class LookupModel {
  const LookupModel({
    required this.key,
    required this.label,
    required this.labelAr,
    required this.color,
    required this.icon,
    this.order,
  });

  final String key;
  final String label;
  final String labelAr;
  final String color;
  final String icon;
  final int? order;

  factory LookupModel.fromJson(Map<String, dynamic> json) {
    return LookupModel(
      key: json['key'] ?? '',
      label: json['label'] ?? '',
      labelAr: json['label_ar'] ?? '',
      color: json['color'] ?? '#000000',
      icon: json['icon'] ?? '',
      order: json['order'],
    );
  }
}
