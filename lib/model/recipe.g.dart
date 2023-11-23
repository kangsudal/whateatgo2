// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 2;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe()
      .._infowgt = fields[0] as String?
      .._manual01 = fields[1] as String?
      .._manual02 = fields[2] as String?
      .._infoeng = fields[3] as String?
      .._manual03 = fields[4] as String?
      .._manual04 = fields[5] as String?
      .._manual05 = fields[6] as String?
      .._attfilenomk = fields[7] as String?
      .._manual06 = fields[8] as String?
      .._manual07 = fields[9] as String?
      .._manual08 = fields[10] as String?
      .._manual09 = fields[11] as String?
      .._rcppartsdtls = fields[12] as String?
      .._manualimg01 = fields[13] as String?
      .._infopro = fields[14] as String?
      .._rcpnm = fields[15] as String?
      .._manual11 = fields[16] as String?
      .._manualimg03 = fields[17] as String?
      .._manual12 = fields[18] as String?
      .._infocar = fields[19] as String?
      .._manualimg02 = fields[20] as String?
      .._manualimg05 = fields[21] as String?
      .._manual10 = fields[22] as String?
      .._manualimg04 = fields[23] as String?
      .._rcpway2 = fields[24] as String?
      .._manual15 = fields[25] as String?
      .._manual16 = fields[26] as String?
      .._manual13 = fields[27] as String?
      .._manual14 = fields[28] as String?
      .._manual19 = fields[29] as String?
      .._manual17 = fields[30] as String?
      .._manual18 = fields[31] as String?
      .._rcppat2 = fields[32] as String?
      .._hashtag = fields[33] as String?
      .._manualimg06 = fields[34] as String?
      .._manualimg07 = fields[35] as String?
      .._manualimg08 = fields[36] as String?
      .._manualimg09 = fields[37] as String?
      .._rcpseq = fields[38] as String?
      .._manualimg16 = fields[39] as String?
      .._manualimg15 = fields[40] as String?
      .._manualimg14 = fields[41] as String?
      .._manualimg13 = fields[42] as String?
      .._manualimg12 = fields[43] as String?
      .._manualimg11 = fields[44] as String?
      .._manualimg10 = fields[45] as String?
      .._manual20 = fields[46] as String?
      .._manualimg19 = fields[47] as String?
      .._manualimg17 = fields[48] as String?
      .._manualimg18 = fields[49] as String?
      .._attfilenomain = fields[50] as String?
      .._manualimg20 = fields[51] as String?
      .._infona = fields[52] as String?
      .._infofat = fields[53] as String?;
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(54)
      ..writeByte(0)
      ..write(obj._infowgt)
      ..writeByte(1)
      ..write(obj._manual01)
      ..writeByte(2)
      ..write(obj._manual02)
      ..writeByte(3)
      ..write(obj._infoeng)
      ..writeByte(4)
      ..write(obj._manual03)
      ..writeByte(5)
      ..write(obj._manual04)
      ..writeByte(6)
      ..write(obj._manual05)
      ..writeByte(7)
      ..write(obj._attfilenomk)
      ..writeByte(8)
      ..write(obj._manual06)
      ..writeByte(9)
      ..write(obj._manual07)
      ..writeByte(10)
      ..write(obj._manual08)
      ..writeByte(11)
      ..write(obj._manual09)
      ..writeByte(12)
      ..write(obj._rcppartsdtls)
      ..writeByte(13)
      ..write(obj._manualimg01)
      ..writeByte(14)
      ..write(obj._infopro)
      ..writeByte(15)
      ..write(obj._rcpnm)
      ..writeByte(16)
      ..write(obj._manual11)
      ..writeByte(17)
      ..write(obj._manualimg03)
      ..writeByte(18)
      ..write(obj._manual12)
      ..writeByte(19)
      ..write(obj._infocar)
      ..writeByte(20)
      ..write(obj._manualimg02)
      ..writeByte(21)
      ..write(obj._manualimg05)
      ..writeByte(22)
      ..write(obj._manual10)
      ..writeByte(23)
      ..write(obj._manualimg04)
      ..writeByte(24)
      ..write(obj._rcpway2)
      ..writeByte(25)
      ..write(obj._manual15)
      ..writeByte(26)
      ..write(obj._manual16)
      ..writeByte(27)
      ..write(obj._manual13)
      ..writeByte(28)
      ..write(obj._manual14)
      ..writeByte(29)
      ..write(obj._manual19)
      ..writeByte(30)
      ..write(obj._manual17)
      ..writeByte(31)
      ..write(obj._manual18)
      ..writeByte(32)
      ..write(obj._rcppat2)
      ..writeByte(33)
      ..write(obj._hashtag)
      ..writeByte(34)
      ..write(obj._manualimg06)
      ..writeByte(35)
      ..write(obj._manualimg07)
      ..writeByte(36)
      ..write(obj._manualimg08)
      ..writeByte(37)
      ..write(obj._manualimg09)
      ..writeByte(38)
      ..write(obj._rcpseq)
      ..writeByte(39)
      ..write(obj._manualimg16)
      ..writeByte(40)
      ..write(obj._manualimg15)
      ..writeByte(41)
      ..write(obj._manualimg14)
      ..writeByte(42)
      ..write(obj._manualimg13)
      ..writeByte(43)
      ..write(obj._manualimg12)
      ..writeByte(44)
      ..write(obj._manualimg11)
      ..writeByte(45)
      ..write(obj._manualimg10)
      ..writeByte(46)
      ..write(obj._manual20)
      ..writeByte(47)
      ..write(obj._manualimg19)
      ..writeByte(48)
      ..write(obj._manualimg17)
      ..writeByte(49)
      ..write(obj._manualimg18)
      ..writeByte(50)
      ..write(obj._attfilenomain)
      ..writeByte(51)
      ..write(obj._manualimg20)
      ..writeByte(52)
      ..write(obj._infona)
      ..writeByte(53)
      ..write(obj._infofat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
