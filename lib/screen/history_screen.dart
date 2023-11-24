import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whateatgo2/model/eat_note.dart';
import 'package:whateatgo2/model/recipe.dart';
import 'package:whateatgo2/riverpod/shakeState.dart';
import 'package:whateatgo2/screen/manual_screen.dart';
import 'package:intl/intl.dart';
import 'package:whateatgo2/screen/more_favorite_screen.dart';
import 'dart:math' as math;

class HistoryScreen extends ConsumerStatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  void initState() {
    //홈화면으로부터 벗어나 manual화면으로 들어왔을때 잠시 shakeDetector를 끈다.
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
//    print("enter");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "기록",
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<EatNote>("eatNoteBox").listenable(),
        builder: (context, Box<EatNote> box, child) {
//            print(box.isOpen);
          if (box.isNotEmpty) {
            //먹어본 음식 MapEntry(레시피:횟수) 리스트 가지고오기 많이 먹은 순서대로              : Box -> List
            final List<MapEntry<Recipe, int>> favoriteFoods =
                getSortedFrequency(box);
            //TODO: 데이터가 많아지면 새로운 Box 만드는것 고려. (음식명:횟수)

            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
//                  color: Colors.grey,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(),
                      Expanded(
                        child: Top3Cards(favoriteFoods: favoriteFoods),
                      ),
                      MoreWidget(favoriteFoods),
                    ],
                  ),
                ),
                Expanded(
                  child: TimeStampList(box),
                ),
              ],
            );
          }
          return Center(
            child: Text('아직 기록된 음식이 없습니다.'),
          );
        },
      ),
    );
  }

  Map<Recipe, int> groupByRcp(Box<EatNote> box) {
    Iterable<EatNote> eatNotes = box.values;
    Map<Recipe, int> map = Map(); //빈 map 생성
    eatNotes.forEach((eatNote) {
      print(map.keys.toList().contains(eatNote.recipe));
      if ((map.keys.toList().contains(eatNote.recipe)) == false) {
        //map에 key가 Recipe'가지말이샐러드'인 데이터가 없으면
        map[eatNote.recipe] = 1; //1번 등장 체크
      } else {
        map[eatNote.recipe] = map[eatNote.recipe]! + 1; //2번째부턴 ++
        print("${eatNote.recipe.rcpnm} 하나 추가: ${map[eatNote.recipe]}");
      }
    });
    return map;
  }

  List<MapEntry<Recipe, int>> getSortedFrequency(Box<EatNote> box) {
    //group by Recipe                      : Box<EatNote> -> Map<Recipe,int>
    //sort desc                           : Map<Recipe,int> -> List<MapEntry<Recipe, int>>

    //음식 기준으로 먹은 빈도 세기
    Map<Recipe, int> countEatFrequencyMap = groupByRcp(box);
//    print(countEatFrequencyMap);
    //{Instance of 'Recipe': 1, Instance of 'Recipe': 1, Instance of 'Recipe': 2}

    //정렬을 위해 map -> list로 변환
    final List<MapEntry<Recipe, int>> favoriteFoods =
        countEatFrequencyMap.entries.toList();
//    print(favoriteFoods);
    //[MapEntry(Instance of 'Recipe': 1), MapEntry(Instance of 'Recipe': 1), MapEntry(Instance of 'Recipe': 2)]

    //value가 가장 큰 순서대로 내림차순 정렬(가장많이먹은)
    favoriteFoods.sort((a, b) {
      MapEntry entryA = a;
      MapEntry entryB = b;
      return (entryB.value).compareTo((entryA.value));
    });
//    print(favoriteFoods);
    //[MapEntry(Instance of 'Recipe': 2), MapEntry(Instance of 'Recipe': 1), MapEntry(Instance of 'Recipe': 1)]

    return favoriteFoods;
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 13,
      ),
      child: Text(
        "가장 자주 먹은 음식",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class TimeStampList extends StatelessWidget {
  final Box box;
  const TimeStampList(this.box, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final item = box.getAt(box.length - index - 1); //최신순
        var datetimeStr =
            DateFormat('yyyy-MM-dd HH:mm').format(item!.eatDateTime);
        return ListTile(
          title: Text(item.recipe.rcpnm!),
          subtitle: Text(datetimeStr),
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      content: TextButton(
                          onPressed: () {
                            box.deleteAt(box.length - index - 1);
                            Navigator.pop(
                              context,
                            );
                          },
                          child: Text("삭제")),
                    )),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => ManualScreen(recipe: item.recipe),
              ),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: box.length,
    );
  }
}

class MoreWidget extends StatelessWidget {
  final List favoriteFoods;

  const MoreWidget(this.favoriteFoods, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => MoreFavoriteScreen(favoriteFoods),
            ),
          );
        },
        child: Text(
          "더보기",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class Top3Cards extends StatelessWidget {
  final List<dynamic> favoriteFoods;

  const Top3Cards({Key? key, required this.favoriteFoods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        favoriteFoods.length < 3
            ? favoriteFoods.length
            : 3, //먹은 음식 종류가 3개 미만이면 그만큼, 그 이상이면 3개까지만
        (index) {
          Recipe food = favoriteFoods[index].key;
          int eatFreq = favoriteFoods[index].value;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ManualScreen(
                        recipe: food,
                      );
                    },
                  ),
                );
              },
              child: Container(
                color: Colors.transparent,
                // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                //     .withOpacity(0.5),
                margin: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: food.attfilenomain!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(food.rcpnm!),
                            Text(
                              "${eatFreq.toString()}번 먹었어요",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
