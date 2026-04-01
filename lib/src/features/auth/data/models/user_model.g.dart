// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: (fields[0] as num).toInt(),
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      fullName: fields[3] as String,
      email: fields[4] as String,
      isActive: fields[5] == null ? 1 : (fields[5] as num).toInt(),
      photoUrl: fields[6] as String?,
      photoThumbMdUrl: fields[7] as String?,
      photoThumbXsUrl: fields[8] as String?,
      roles: fields[9] == null
          ? const []
          : (fields[9] as List).cast<RoleModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.photoUrl)
      ..writeByte(7)
      ..write(obj.photoThumbMdUrl)
      ..writeByte(8)
      ..write(obj.photoThumbXsUrl)
      ..writeByte(9)
      ..write(obj.roles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
