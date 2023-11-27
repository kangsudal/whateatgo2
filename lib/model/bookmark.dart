import 'recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'bookmark.g.dart';

@HiveType(typeId: 3)
class Bookmark {
  //데이터베이스 구조
  @HiveField(0)
  Recipe recipe; //음식명
  @HiveField(1)
  bool isBookmarked; //먹은날짜

  Bookmark({required this.recipe, required this.isBookmarked});

  @override
  String toString() {
    return 'BookMark{recipe: $recipe, isBookMarked: $isBookmarked}';
  }
}
