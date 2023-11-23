import 'package:hive/hive.dart';
part 'recipe.g.dart';

/// INFO_WGT : ""
/// MANUAL01 : "1. 깨끗이 씻어 손질한 애호박, 당근과 기둥을 뗀 표고버섯을 잘게 다지듯이 썬다.a"
/// MANUAL02 : "2. 누룽지는 1cm 정도로 잘게 부숴준다.b"
/// INFO_ENG : "380"
/// MANUAL03 : "3. 냄비에 참기름을 두르고 썰어놓은 채소를 볶다가 누룽지와 물을 넣고 끓인다."
/// MANUAL04 : "4. 누룽지가 살짝 퍼지면 순두부를 넣고 흰후추와 소금을 넣는다."
/// MANUAL05 : "5. 죽이 끓으면 달걀을 풀어 넣고 한 소끔 끓여낸 후 참깨를 뿌려 마무리 한다.c"
/// ATT_FILE_NO_MK : "http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00016_1.png"
/// MANUAL06 : ""
/// MANUAL07 : ""
/// MANUAL08 : ""
/// MANUAL09 : ""
/// RCP_PARTS_DTLS : "채소준비\n애호박 30g(1/6개), 표고버섯 20g(2개), 당근 5g(3×2×1cm)\n누룽지 죽\n누룽지 70g(1/3컵), 순두부 100g(1/4모), 달걀 50g(1개),참기름 3g(2/3작은술), 소금 약간, 참깨 약간, 흰 후추 약간"
/// MANUAL_IMG01 : "http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00016_1.png"
/// INFO_PRO : "12"
/// RCP_NM : "누룽지 두부 계란죽"
/// MANUAL11 : ""
/// MANUAL_IMG03 : ""
/// MANUAL12 : ""
/// INFO_CAR : "67"
/// MANUAL_IMG02 : "http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00016_2.png"
/// MANUAL_IMG05 : "http://www.foodsafetykorea.go.kr/uploadimg/cook/20_00016_5.png"
/// MANUAL10 : ""
/// MANUAL_IMG04 : ""
/// RCP_WAY2 : "끓이기"
/// MANUAL15 : ""
/// MANUAL16 : ""
/// MANUAL13 : ""
/// MANUAL14 : ""
/// MANUAL19 : ""
/// MANUAL17 : ""
/// MANUAL18 : ""
/// RCP_PAT2 : "밥"
/// HASH_TAG : "순두부"
/// MANUAL_IMG06 : ""
/// MANUAL_IMG07 : ""
/// MANUAL_IMG08 : ""
/// MANUAL_IMG09 : ""
/// RCP_SEQ : "16"
/// MANUAL_IMG16 : ""
/// MANUAL_IMG15 : ""
/// MANUAL_IMG14 : ""
/// MANUAL_IMG13 : ""
/// MANUAL_IMG12 : ""
/// MANUAL_IMG11 : ""
/// MANUAL_IMG10 : ""
/// MANUAL20 : ""
/// MANUAL_IMG19 : ""
/// MANUAL_IMG17 : ""
/// MANUAL_IMG18 : ""
/// ATT_FILE_NO_MAIN : "http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00016_2.png"
/// MANUAL_IMG20 : ""
/// INFO_NA : "271"
/// INFO_FAT : "7"
@HiveType(typeId: 2)
class Recipe {
  @HiveField(0)
  String? _infowgt;
  @HiveField(1)
  String? _manual01;
  @HiveField(2)
  String? _manual02;
  @HiveField(3)
  String? _infoeng;
  @HiveField(4)
  String? _manual03;
  @HiveField(5)
  String? _manual04;
  @HiveField(6)
  String? _manual05;
  @HiveField(7)
  String? _attfilenomk;
  @HiveField(8)
  String? _manual06;
  @HiveField(9)
  String? _manual07;
  @HiveField(10)
  String? _manual08;
  @HiveField(11)
  String? _manual09;
  @HiveField(12)
  String? _rcppartsdtls;
  @HiveField(13)
  String? _manualimg01;
  @HiveField(14)
  String? _infopro;
  @HiveField(15)
  String? _rcpnm;
  @HiveField(16)
  String? _manual11;
  @HiveField(17)
  String? _manualimg03;
  @HiveField(18)
  String? _manual12;
  @HiveField(19)
  String? _infocar;
  @HiveField(20)
  String? _manualimg02;
  @HiveField(21)
  String? _manualimg05;
  @HiveField(22)
  String? _manual10;
  @HiveField(23)
  String? _manualimg04;
  @HiveField(24)
  String? _rcpway2;
  @HiveField(25)
  String? _manual15;
  @HiveField(26)
  String? _manual16;
  @HiveField(27)
  String? _manual13;
  @HiveField(28)
  String? _manual14;
  @HiveField(29)
  String? _manual19;
  @HiveField(30)
  String? _manual17;
  @HiveField(31)
  String? _manual18;
  @HiveField(32)
  String? _rcppat2;
  @HiveField(33)
  String? _hashtag;
  @HiveField(34)
  String? _manualimg06;
  @HiveField(35)
  String? _manualimg07;
  @HiveField(36)
  String? _manualimg08;
  @HiveField(37)
  String? _manualimg09;
  @HiveField(38)
  String? _rcpseq;
  @HiveField(39)
  String? _manualimg16;
  @HiveField(40)
  String? _manualimg15;
  @HiveField(41)
  String? _manualimg14;
  @HiveField(42)
  String? _manualimg13;
  @HiveField(43)
  String? _manualimg12;
  @HiveField(44)
  String? _manualimg11;
  @HiveField(45)
  String? _manualimg10;
  @HiveField(46)
  String? _manual20;
  @HiveField(47)
  String? _manualimg19;
  @HiveField(48)
  String? _manualimg17;
  @HiveField(49)
  String? _manualimg18;
  @HiveField(50)
  String? _attfilenomain;
  @HiveField(51)
  String? _manualimg20;
  @HiveField(52)
  String? _infona;
  @HiveField(53)
  String? _infofat;

  String? get infowgt => _infowgt;
  String? get manual01 => _manual01;
  String? get manual02 => _manual02;
  String? get infoeng => _infoeng;
  String? get manual03 => _manual03;
  String? get manual04 => _manual04;
  String? get manual05 => _manual05;
  String? get attfilenomk => _attfilenomk;
  String? get manual06 => _manual06;
  String? get manual07 => _manual07;
  String? get manual08 => _manual08;
  String? get manual09 => _manual09;
  String? get rcppartsdtls => _rcppartsdtls;
  String? get manualimg01 => _manualimg01;
  String? get infopro => _infopro;
  String? get rcpnm => _rcpnm;
  String? get manual11 => _manual11;
  String? get manualimg03 => _manualimg03;
  String? get manual12 => _manual12;
  String? get infocar => _infocar;
  String? get manualimg02 => _manualimg02;
  String? get manualimg05 => _manualimg05;
  String? get manual10 => _manual10;
  String? get manualimg04 => _manualimg04;
  String? get rcpway2 => _rcpway2;
  String? get manual15 => _manual15;
  String? get manual16 => _manual16;
  String? get manual13 => _manual13;
  String? get manual14 => _manual14;
  String? get manual19 => _manual19;
  String? get manual17 => _manual17;
  String? get manual18 => _manual18;
  String? get rcppat2 => _rcppat2;
  String? get hashtag => _hashtag;
  String? get manualimg06 => _manualimg06;
  String? get manualimg07 => _manualimg07;
  String? get manualimg08 => _manualimg08;
  String? get manualimg09 => _manualimg09;
  String? get rcpseq => _rcpseq;
  String? get manualimg16 => _manualimg16;
  String? get manualimg15 => _manualimg15;
  String? get manualimg14 => _manualimg14;
  String? get manualimg13 => _manualimg13;
  String? get manualimg12 => _manualimg12;
  String? get manualimg11 => _manualimg11;
  String? get manualimg10 => _manualimg10;
  String? get manual20 => _manual20;
  String? get manualimg19 => _manualimg19;
  String? get manualimg17 => _manualimg17;
  String? get manualimg18 => _manualimg18;
  String? get attfilenomain => _attfilenomain;
  String? get manualimg20 => _manualimg20;
  String? get infona => _infona;
  String? get infofat => _infofat;

  Recipe(
      {String? infowgt,
      String? manual01,
      String? manual02,
      String? infoeng,
      String? manual03,
      String? manual04,
      String? manual05,
      String? attfilenomk,
      String? manual06,
      String? manual07,
      String? manual08,
      String? manual09,
      String? rcppartsdtls,
      String? manualimg01,
      String? infopro,
      String? rcpnm,
      String? manual11,
      String? manualimg03,
      String? manual12,
      String? infocar,
      String? manualimg02,
      String? manualimg05,
      String? manual10,
      String? manualimg04,
      String? rcpway2,
      String? manual15,
      String? manual16,
      String? manual13,
      String? manual14,
      String? manual19,
      String? manual17,
      String? manual18,
      String? rcppat2,
      String? hashtag,
      String? manualimg06,
      String? manualimg07,
      String? manualimg08,
      String? manualimg09,
      String? rcpseq,
      String? manualimg16,
      String? manualimg15,
      String? manualimg14,
      String? manualimg13,
      String? manualimg12,
      String? manualimg11,
      String? manualimg10,
      String? manual20,
      String? manualimg19,
      String? manualimg17,
      String? manualimg18,
      String? attfilenomain,
      String? manualimg20,
      String? infona,
      String? infofat}) {
    _infowgt = infowgt;
    _manual01 = manual01;
    _manual02 = manual02;
    _infoeng = infoeng;
    _manual03 = manual03;
    _manual04 = manual04;
    _manual05 = manual05;
    _attfilenomk = attfilenomk;
    _manual06 = manual06;
    _manual07 = manual07;
    _manual08 = manual08;
    _manual09 = manual09;
    _rcppartsdtls = rcppartsdtls;
    _manualimg01 = manualimg01;
    _infopro = infopro;
    _rcpnm = rcpnm;
    _manual11 = manual11;
    _manualimg03 = manualimg03;
    _manual12 = manual12;
    _infocar = infocar;
    _manualimg02 = manualimg02;
    _manualimg05 = manualimg05;
    _manual10 = manual10;
    _manualimg04 = manualimg04;
    _rcpway2 = rcpway2;
    _manual15 = manual15;
    _manual16 = manual16;
    _manual13 = manual13;
    _manual14 = manual14;
    _manual19 = manual19;
    _manual17 = manual17;
    _manual18 = manual18;
    _rcppat2 = rcppat2;
    _hashtag = hashtag;
    _manualimg06 = manualimg06;
    _manualimg07 = manualimg07;
    _manualimg08 = manualimg08;
    _manualimg09 = manualimg09;
    _rcpseq = rcpseq;
    _manualimg16 = manualimg16;
    _manualimg15 = manualimg15;
    _manualimg14 = manualimg14;
    _manualimg13 = manualimg13;
    _manualimg12 = manualimg12;
    _manualimg11 = manualimg11;
    _manualimg10 = manualimg10;
    _manual20 = manual20;
    _manualimg19 = manualimg19;
    _manualimg17 = manualimg17;
    _manualimg18 = manualimg18;
    _attfilenomain = attfilenomain;
    _manualimg20 = manualimg20;
    _infona = infona;
    _infofat = infofat;
  }

  Recipe.fromJson(Map<String, dynamic> json) {
    _infowgt = json["INFO_WGT"];
    _manual01 = json["MANUAL01"];
    _manual02 = json["MANUAL02"];
    _infoeng = json["INFO_ENG"];
    _manual03 = json["MANUAL03"];
    _manual04 = json["MANUAL04"];
    _manual05 = json["MANUAL05"];
    _attfilenomk = json["ATT_FILE_NO_MK"];
    _manual06 = json["MANUAL06"];
    _manual07 = json["MANUAL07"];
    _manual08 = json["MANUAL08"];
    _manual09 = json["MANUAL09"];
    _rcppartsdtls = json["RCP_PARTS_DTLS"];
    _manualimg01 = json["MANUAL_IMG01"];
    _infopro = json["INFO_PRO"];
    _rcpnm = json["RCP_NM"];
    _manual11 = json["MANUAL11"];
    _manualimg03 = json["MANUAL_IMG03"];
    _manual12 = json["MANUAL12"];
    _infocar = json["INFO_CAR"];
    _manualimg02 = json["MANUAL_IMG02"];
    _manualimg05 = json["MANUAL_IMG05"];
    _manual10 = json["MANUAL10"];
    _manualimg04 = json["MANUAL_IMG04"];
    _rcpway2 = json["RCP_WAY2"];
    _manual15 = json["MANUAL15"];
    _manual16 = json["MANUAL16"];
    _manual13 = json["MANUAL13"];
    _manual14 = json["MANUAL14"];
    _manual19 = json["MANUAL19"];
    _manual17 = json["MANUAL17"];
    _manual18 = json["MANUAL18"];
    _rcppat2 = json["RCP_PAT2"];
    _hashtag = json["HASH_TAG"];
    _manualimg06 = json["MANUAL_IMG06"];
    _manualimg07 = json["MANUAL_IMG07"];
    _manualimg08 = json["MANUAL_IMG08"];
    _manualimg09 = json["MANUAL_IMG09"];
    _rcpseq = json["RCP_SEQ"];
    _manualimg16 = json["MANUAL_IMG16"];
    _manualimg15 = json["MANUAL_IMG15"];
    _manualimg14 = json["MANUAL_IMG14"];
    _manualimg13 = json["MANUAL_IMG13"];
    _manualimg12 = json["MANUAL_IMG12"];
    _manualimg11 = json["MANUAL_IMG11"];
    _manualimg10 = json["MANUAL_IMG10"];
    _manual20 = json["MANUAL20"];
    _manualimg19 = json["MANUAL_IMG19"];
    _manualimg17 = json["MANUAL_IMG17"];
    _manualimg18 = json["MANUAL_IMG18"];
    _attfilenomain = json["ATT_FILE_NO_MAIN"];
    _manualimg20 = json["MANUAL_IMG20"];
    _infona = json["INFO_NA"];
    _infofat = json["INFO_FAT"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["INFO_WGT"] = _infowgt;
    map["MANUAL01"] = _manual01;
    map["MANUAL02"] = _manual02;
    map["INFO_ENG"] = _infoeng;
    map["MANUAL03"] = _manual03;
    map["MANUAL04"] = _manual04;
    map["MANUAL05"] = _manual05;
    map["ATT_FILE_NO_MK"] = _attfilenomk;
    map["MANUAL06"] = _manual06;
    map["MANUAL07"] = _manual07;
    map["MANUAL08"] = _manual08;
    map["MANUAL09"] = _manual09;
    map["RCP_PARTS_DTLS"] = _rcppartsdtls;
    map["MANUAL_IMG01"] = _manualimg01;
    map["INFO_PRO"] = _infopro;
    map["RCP_NM"] = _rcpnm;
    map["MANUAL11"] = _manual11;
    map["MANUAL_IMG03"] = _manualimg03;
    map["MANUAL12"] = _manual12;
    map["INFO_CAR"] = _infocar;
    map["MANUAL_IMG02"] = _manualimg02;
    map["MANUAL_IMG05"] = _manualimg05;
    map["MANUAL10"] = _manual10;
    map["MANUAL_IMG04"] = _manualimg04;
    map["RCP_WAY2"] = _rcpway2;
    map["MANUAL15"] = _manual15;
    map["MANUAL16"] = _manual16;
    map["MANUAL13"] = _manual13;
    map["MANUAL14"] = _manual14;
    map["MANUAL19"] = _manual19;
    map["MANUAL17"] = _manual17;
    map["MANUAL18"] = _manual18;
    map["RCP_PAT2"] = _rcppat2;
    map["HASH_TAG"] = _hashtag;
    map["MANUAL_IMG06"] = _manualimg06;
    map["MANUAL_IMG07"] = _manualimg07;
    map["MANUAL_IMG08"] = _manualimg08;
    map["MANUAL_IMG09"] = _manualimg09;
    map["RCP_SEQ"] = _rcpseq;
    map["MANUAL_IMG16"] = _manualimg16;
    map["MANUAL_IMG15"] = _manualimg15;
    map["MANUAL_IMG14"] = _manualimg14;
    map["MANUAL_IMG13"] = _manualimg13;
    map["MANUAL_IMG12"] = _manualimg12;
    map["MANUAL_IMG11"] = _manualimg11;
    map["MANUAL_IMG10"] = _manualimg10;
    map["MANUAL20"] = _manual20;
    map["MANUAL_IMG19"] = _manualimg19;
    map["MANUAL_IMG17"] = _manualimg17;
    map["MANUAL_IMG18"] = _manualimg18;
    map["ATT_FILE_NO_MAIN"] = _attfilenomain;
    map["MANUAL_IMG20"] = _manualimg20;
    map["INFO_NA"] = _infona;
    map["INFO_FAT"] = _infofat;
    return map;
  }

  @override
  bool operator ==(Object other) {
    return (other is Recipe) &&
        (other.rcpnm == rcpnm) &&
        (other.rcpseq == rcpseq);
  }

  @override
  int get hashCode => (rcpnm!.hashCode) ^ (rcpseq!.hashCode);
}
