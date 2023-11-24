// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkAdapter extends TypeAdapter<BookMark> {
  @override
  final int typeId = 3;

  @override
  BookMark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMark(
      recipe: fields[0] as Recipe,
      isBookMarked: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BookMark obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.recipe)
      ..writeByte(1)
      ..write(obj.isBookMarked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
