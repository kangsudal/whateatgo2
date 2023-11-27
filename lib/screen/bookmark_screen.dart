import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whateatgo2/model/bookmark.dart';
import 'package:whateatgo2/riverpod/shakeState.dart';
import 'package:whateatgo2/screen/manual_screen.dart';

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
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Bookmark>('bookmarkBox').listenable(),
        builder: (BuildContext context, Box<Bookmark> box, Widget? child) {
          if (box.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                Bookmark currentBookmark = box.getAt(index)!;
                return ListTile(
                  leading: SizedBox(
                    width: 60,
                    height: 60,
                    child: CachedNetworkImage(
                      imageUrl: currentBookmark.recipe.attfilenomain!,
                    ),
                  ),
                  title: Text(
                    currentBookmark.recipe.rcpnm.toString(),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ManualScreen(
                        recipe: currentBookmark.recipe,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      box.deleteAt(index);
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: box.length,
            );
          }
          return const Center(
            child: Text('관심 등록한 레시피가 없습니다.'),
          );
        },
      ),
    );
  }
}
