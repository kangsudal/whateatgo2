import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shake/shake.dart';
import 'package:whateatgo2/riverpod/homeScreenState.dart';

//1. 흔들었을때,refresh 버튼을 눌렀을때 random 인덱스값
final diceNumberProvider = StateNotifierProvider<DiceNumberNotifier, int>(
  (ref) {
    //홈화면 스위치로 필터한 리스트 개수 반영
    final homeScreenRecipes = ref.watch(homeScreenRecipesProvider);
    return DiceNumberNotifier(length: homeScreenRecipes.length);
  },
);

class DiceNumberNotifier extends StateNotifier<int> {
  DiceNumberNotifier({required this.length}) : super(-1);

  int length;

  //주사위를 굴립니다.
  void roll() {
    debugPrint('0~$length개 요리');
    // 시작은 (-1 , 0~1114)이고 홈화면에서 필터하고난 뒤 리스트 수 안에서 인덱스가 나오도록 함
    try {
      state = Random().nextInt(length);
    } catch (e) {
      //레시피 필터 결과 개수가 0개일때 에러가 나므로 -2로 넣어준다.
      debugPrint('shakeState roll()에서 에러남: $e');
      state = -2;
    }
    debugPrint('$state번째 요리');
  }
}

//2. ShakeDetector Provider
final shakeDetectorProvider = StateProvider(
  (ref) => ShakeDetector.waitForStart(
    shakeThresholdGravity: 2,
    onPhoneShake: () {
      ref.read(diceNumberProvider.notifier).roll();
    },
  ),
);
