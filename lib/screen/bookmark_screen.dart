import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whateatgo2/riverpod/shakeState.dart';

class BookMarkScreen extends ConsumerStatefulWidget {
  const BookMarkScreen({super.key});

  @override
  ConsumerState<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends ConsumerState<BookMarkScreen> {
  @override
  void initState() {
    //홈화면으로부터 벗어나 관심항목 화면으로 들어왔을때 잠시 shakeDetector를 끈다.
    ref.read(shakeDetectorProvider.notifier).state.stopListening();
    super.initState();
  }

  @override
  void deactivate() {
    //State 객체가 Flutter의 구성 트리로부터 제거될 때 호출
    //다시 홈화면으로 갈땐 shakeDetector를 킨다.
    ref.read(shakeDetectorProvider.notifier).state.startListening();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('관심 항목'),
      ),
    );
  }
}
