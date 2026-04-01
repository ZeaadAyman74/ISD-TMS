import 'package:hive_ce/hive.dart';

part 'permission_model.g.dart';

@HiveType(typeId: 1)
class PermissionModel extends HiveObject {
  PermissionModel({
    required this.id,
    required this.name,
    this.labelEn,
    this.labelAr,
    this.model,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? labelEn;

  @HiveField(3)
  final String? labelAr;

  @HiveField(4)
  final String? model;

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      labelEn: json['label_en'],
      labelAr: json['label_ar'],
      model: json['model'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'label_en': labelEn,
        'label_ar': labelAr,
        'model': model,
      };
}
