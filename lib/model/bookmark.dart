import 'recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'bookmark.g.dart';

@HiveType(typeId: 3)
class BookMark {
  //데이터베이스 구조
  @HiveField(0)
  Recipe recipe; //음식명
  @HiveField(1)
  bool isBookMarked; //먹은날짜

  BookMark({required this.recipe, required this.isBookMarked});

  @override
  String toString() {
    return 'BookMark{recipe: $recipe, isBookMarked: $isBookMarked}';
  }
}
