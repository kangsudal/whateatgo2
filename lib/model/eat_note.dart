import 'recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'eat_note.g.dart';

@HiveType(typeId: 1)
class EatNote {
  //데이터베이스 구조
  @HiveField(0)
  Recipe recipe; //음식명
  @HiveField(1)
  DateTime eatDateTime; //먹은날짜

  EatNote({required this.recipe, required this.eatDateTime});

  @override
  String toString() {
    return 'EatNote{recipe: $recipe, eatDateTime: $eatDateTime}';
  }
}
