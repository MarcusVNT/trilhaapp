// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksHiveModelAdapter extends TypeAdapter<TasksHiveModel> {
  @override
  final int typeId = 1;

  @override
  TasksHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksHiveModel()
      ..descricao = fields[0] as String
      ..concluido = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, TasksHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.descricao)
      ..writeByte(1)
      ..write(obj.concluido);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
