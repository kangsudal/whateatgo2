import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whateatgo2/model/bookmark.dart';
import 'package:whateatgo2/riverpod/homeScreenState.dart';
import 'package:whateatgo2/riverpod/shakeState.dart';
import 'package:whateatgo2/screen/bookmark_screen.dart';
import 'package:whateatgo2/screen/history_screen.dart';
import 'package:whateatgo2/screen/list_screen.dart';
import 'package:whateatgo2/screen/manual_screen.dart';

import 'package:whateatgo2/model/recipe.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final int diceNumber = ref.watch(diceNumberProvider);
    final List<Recipe> recipeList = ref.watch(homeScreenRecipesProvider);
    final Recipe? currentRecipe = diceNumber == -1 || diceNumber == -2
        ? null
        : recipeList.elementAt(diceNumber);
    if (currentRecipe != null) {
      debugPrint('분류: ${currentRecipe.rcppat2}, 요리명: ${currentRecipe.rcpnm}');
    }
    Map<String, bool> categories = ref.watch(homeScreenRecipeCategoryProvider);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
        appBar: AppBar(),
        endDrawer: Drawer(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              ListTile(
                title: const Text(
                  '전체',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  '관심 항목',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BookMarkScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  '기록',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HistoryScreen(),
                    ),
                  );
                },
              ),
              const ListTile(
                title: Text('필터)'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: myController,
                        style: const TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                          hintText: "예:두부 버섯(띄어쓰기로 구분합니다)",
                          fillColor: Colors.grey,
                        ),
                        onChanged: (ingredients) {
                          bool a = ref.exists(diceNumberProvider);

                          ref
                              .read(homeScreenRecipesProvider.notifier)
                              .filterList(ingredients, categories);

                          debugPrint('다이스넘버:$diceNumber');
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text('${recipeList.length.toString()}개'),
                  ],
                ),
              ),
              // https://flutterguide.com/how-to-use-spread-operator-in-flutter/
              ...categories.keys
                  .map(
                    (key) => SwitchListTile.adaptive(
                      title: Text(key),
                      value: categories[key]!,
                      onChanged: (value) {
                        setState(() {
                          categories[key] = value;
                          // 체크박스 토글시 리스트 필터를 적용
                          ref
                              .read(homeScreenRecipesProvider.notifier)
                              .filterList(myController.text, categories);
                        });
                      },
                    ),
                  )
                  .toList(),
              const BuymeacoffeeWidget(),
            ],
          ),
        ),
        body: ContentWidget(
          currentRecipe: currentRecipe,
          diceNumber: diceNumber,
        ),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.black,
          child: const Icon(Icons.refresh),
          onPressed: () {
            ref.read(diceNumberProvider.notifier).roll();
          },
        ),
      ),
    );
  }
}

class BuymeacoffeeWidget extends StatelessWidget {
  const BuymeacoffeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ListTile(
          title: const Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.coffee,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Buy me a coffee',
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  content: const Text('고맙습니다! 준비중입니다 ㅎㅎ'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.currentRecipe,
    required this.diceNumber,
  });

  final Recipe? currentRecipe;
  final int diceNumber;

  @override
  Widget build(BuildContext context) {
    if (diceNumber == -1) {
      return Center(
        child: Text(
          '흔들어주세요!',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );
    } else if (diceNumber == -2) {
      return Center(
        child: Text(
          '조건에 맞는 레시피가 없습니다.',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: TopWidget(currentRecipe: currentRecipe),
            ),
            BottomButtonsWidget(currentRecipe: currentRecipe),
          ],
        ),
      );
    }
  }
}

class TopWidget extends StatefulWidget {
  const TopWidget({
    super.key,
    required this.currentRecipe,
  });

  final Recipe? currentRecipe;

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  late bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    Box<Bookmark> box = Hive.box<Bookmark>('bookmarkBox');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.currentRecipe!.attfilenomain!,
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) {
                int index = int.parse(widget.currentRecipe!.rcpseq!);
                if (box.containsKey(index) == false) {
                  box.put(
                    index,
                    Bookmark(
                        recipe: widget.currentRecipe!, isBookmarked: false),
                  );
                }
                isBookmarked = box.get(index)!.isBookmarked;
                return Stack(
                  children: [
                    child,
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              box.put(
                                index,
                                Bookmark(
                                    recipe: widget.currentRecipe!,
                                    isBookmarked: !isBookmarked),
                              );
                            });
                          },
                          icon: isBookmarked == true
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.pinkAccent,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return SizedBox(
                width: 50,
                height: 50,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        Text(
          widget.currentRecipe!.rcpnm!,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.black,
                // fontFamily: 'BlackHanSans',
              ),
        ),
      ],
    );
  }
}

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({
    super.key,
    required this.currentRecipe,
  });

  final Recipe? currentRecipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(
              color: Colors.black,
              width: 2.5,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ManualScreen(recipe: currentRecipe!);
                },
              ),
            );
          },
          child: const Text('Recipe'),
        ),
        /*
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Restaurant'),
        ),
         */
      ],
    );
  }
}
