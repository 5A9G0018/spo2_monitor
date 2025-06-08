// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spo2_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Spo2RecordAdapter extends TypeAdapter<Spo2Record> {
  @override
  final int typeId = 0;

  @override
  Spo2Record read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spo2Record(
      spo2: fields[0] as int,
      heartRate: fields[1] as int,
      timestamp: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Spo2Record obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.spo2)
      ..writeByte(1)
      ..write(obj.heartRate)
      ..writeByte(2)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Spo2RecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
