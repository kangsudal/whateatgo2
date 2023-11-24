// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eat_note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EatNoteAdapter extends TypeAdapter<EatNote> {
  @override
  final int typeId = 1;

  @override
  EatNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EatNote(
      recipe: fields[0] as Recipe,
      eatDateTime: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, EatNote obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.recipe)
      ..writeByte(1)
      ..write(obj.eatDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EatNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
