// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PermissionModelAdapter extends TypeAdapter<PermissionModel> {
  @override
  final typeId = 1;

  @override
  PermissionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PermissionModel(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      labelEn: fields[2] as String?,
      labelAr: fields[3] as String?,
      model: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PermissionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.labelEn)
      ..writeByte(3)
      ..write(obj.labelAr)
      ..writeByte(4)
      ..write(obj.model);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PermissionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
