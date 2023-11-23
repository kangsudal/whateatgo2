import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/recipe.dart';

/*
총 1114
밥  116
후식 132
반찬 560
일품 167
국&찌개 102
기타 37
*/

//1. 리스트 화면에 체크박스 상태 관리
final recipeCategoryProvider = AutoDisposeStateProvider<Map<String, bool>>(
  (ref) => {
    '밥': true,
    '후식': true,
    '반찬': true,
    '일품': true,
    '국&찌개': true,
    '기타': true,
  },
);

//2. 리스트 화면에 후보군 리스트(초기값은 모든 리스트)
//검색 필터를 적용한 리스트 Provider
//사용자가 화면상에서 떠나고 다시 진입했을 때 상태를 초기화 할 경우 autoDispose를 사용한다.
final listScreenRecipesProvider =
    StateNotifierProvider.autoDispose<FilteredRecipeListNotifier, List<Recipe>>(
  (ref) => FilteredRecipeListNotifier(),
);

class FilteredRecipeListNotifier extends StateNotifier<List<Recipe>> {
  FilteredRecipeListNotifier()
      : super(Hive.box<Recipe>('recipeBox').values.toList());

  //필터할 대상(부모 리스트)
  void setDefaultList() {
    state = Hive.box<Recipe>('recipeBox').values.toList();
  }

  List<Recipe> filterList(String keywords, Map<String, bool> categories) {
    //'밥', '후식', '반찬', '일품',  '국&찌개' 분류 체크박스에서
    // 체크된(true) key 값만 가져온다. (국&찌개, 후식 등)
    // https://stackoverflow.com/questions/73309888/how-to-return-a-list-of-map-keys-if-they-are-true
    List<String> trueCategories = [];
    categories.forEach((category, isChecked) {
      if (isChecked == true) {
        trueCategories.add(category);
      }
    });

    //검색 키워드 리스트. 띄어쓰기 기준
    List<String> keywordList = keywords.split(' ');

    //검색어를 포함하고 & 체크된 음식 분류를 포함하고있는 레시피를 담을 리스트
    List<Recipe> filtered = []; //최종 리스트
    List<Recipe> tmpFiltered = [];

    for (String category in trueCategories) {
      //1차 애벌 필터
      tmpFiltered += Hive.box<Recipe>('recipeBox')
          .values
          .toList()
          .where(
            (element) =>
                (element.rcpnm!.contains(keywordList[0])) || //메뉴명
                (element.hashtag!.contains(keywordList[0])) || //해쉬태그
                (element.rcppartsdtls!.contains(keywordList[0])), //재료정보
          )
          .where((recipe) => recipe.rcppat2 == category) //요리종류
          .toList();
    }

    //키워드가 하나만 있으면 여기서 마무리
    if (keywordList.length == 1) {
      filtered = tmpFiltered;
      state = filtered;
      return filtered;
    }

    //더 많으면 keyword 개수만큼 nested filter 해준다.
    for (int i = 0; i < keywordList.length; i++) {
      tmpFiltered = tmpFiltered
          .where(
            (recipe) =>
                (recipe.rcpnm!.contains(keywordList[i])) || //메뉴명
                (recipe.hashtag!.contains(keywordList[i])) || //해쉬태그
                (recipe.rcppartsdtls!.contains(keywordList[i])), //재료정보
          )
          .toList();
    }

    filtered = tmpFiltered;
    state = filtered;
    return filtered;
  }
}
