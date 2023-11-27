import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whateatgo2/model/bookmark.dart';
import 'package:whateatgo2/model/eat_note.dart';
import 'package:whateatgo2/riverpod/shakeState.dart';
import 'package:whateatgo2/screen/home_screen.dart';

import 'model/recipe.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(EatNoteAdapter());
  Hive.registerAdapter(BookMarkAdapter());
  await Hive.openBox<EatNote>('eatNoteBox');
  await Hive.openBox<Bookmark>('bookmarkBox');
  Box<Recipe> recipeBox = await Hive.openBox<Recipe>('recipeBox');
  if (recipeBox.isEmpty) {
    await fetchData(); // JSON -> recipeBox 저장
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(shakeDetectorProvider.notifier).state.startListening();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 앱의 라이프사이클 상태가 변경될 때마다 호출된다.
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(shakeDetectorProvider.notifier).state.startListening();
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        ref.read(shakeDetectorProvider.notifier).state.stopListening();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(), //ListScreen(),
      theme: ThemeData(
        fontFamily: 'SongMyung',
        primaryColor: Colors.black,
        //refresh 버튼 색깔
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}

Future<void> fetchData() async {
  //로컬 파일로부터 모든 레시피를 불러와 DB에 넣는다.
  try {
    //파일을 읽어와 List<Recipe>로 변환시킨다.
    String jsonString = await rootBundle.loadString('sourceFile');
    Map<String, dynamic> dataMap = jsonDecode(jsonString);
    List<dynamic> dataList = dataMap['COOKRCP01']['row'];
    List<Recipe> recipes =
        dataList.map((json) => Recipe.fromJson(json)).toList();

    //DB에 넣는다.
    Box<Recipe> recipeBox = Hive.box('recipeBox');
    recipeBox.addAll(recipes);
  } catch (e) {
    throw Exception(e);
  }
}
