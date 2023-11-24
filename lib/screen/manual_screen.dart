import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:whateatgo2/model/eat_note.dart';
import 'package:whateatgo2/riverpod/shakeState.dart';

import '../model/recipe.dart';

class ManualScreen extends ConsumerStatefulWidget {
  final Recipe recipe; //생성자 매개변수로 Recipe를 받는다
  const ManualScreen({
    super.key,
    required this.recipe,
  });

  @override
  ConsumerState<ManualScreen> createState() => _ManualScreenState();
}

class _ManualScreenState extends ConsumerState<ManualScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  bool isLoading = false;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.recipe.rcpnm!),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              screenshotController.capture().then((capturedImage) async {
                if (capturedImage != null) {
                  final directory = await getApplicationDocumentsDirectory();
                  final imagePath =
                      await File('${directory.path}/${widget.recipe.rcpnm}.png')
                          .create();
                  await imagePath.writeAsBytes(capturedImage);
                  XFile xFile = XFile(imagePath.path);
                  setState(() {
                    // 이미지 파일 다 생성하면 로딩바 사라지게
                    isLoading = false;
                  });

                  /// Share Plugin
                  await Share.shareXFiles([xFile]);
                }
                debugPrint('Thank you for sharing the picture!');
              }).catchError((onError) {
                debugPrint(onError);
              });
            },
            icon: const Icon(
              Icons.share,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            ListView(
              children: [
                Screenshot(
                  controller: screenshotController,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          //재료 or 썸네일 사진
                          if (widget.recipe.attfilenomk != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.attfilenomk!),
                          const SizedBox(height: 10),
                          //재료
                          const Text(
                            '재료:',
                            style: TextStyle(fontSize: 30),
                          ),
                          if (widget.recipe.rcppartsdtls != '')
                            Text(widget.recipe.rcppartsdtls!,
                                style: const TextStyle(fontSize: 20)),
                          const SizedBox(
                            height: 50,
                          ),
                          //1
                          if (widget.recipe.manual01 != '')
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(widget.recipe.manual01!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg01 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg01!),
                          //2
                          if (widget.recipe.manual02 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual02!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg02 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg02!),
                          //3
                          if (widget.recipe.manual03 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual03!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg03 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg03!),
                          //4
                          if (widget.recipe.manual04 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual04!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg04 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg04!),
                          //5
                          if (widget.recipe.manual05 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual05!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg05 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg05!),
                          //6
                          if (widget.recipe.manual06 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual06!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg06 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg06!),
                          //7
                          if (widget.recipe.manual07 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual07!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg07 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg07!),
                          //8
                          if (widget.recipe.manual08 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual08!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg08 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg08!),
                          //9
                          if (widget.recipe.manual09 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual09!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg09 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg09!),
                          //10
                          if (widget.recipe.manual10 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual10!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg10 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg10!),
                          //11
                          if (widget.recipe.manual11 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual11!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg11 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg11!),
                          //12
                          if (widget.recipe.manual12 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual12!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg12 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg12!),
                          //13
                          if (widget.recipe.manual13 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual13!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg13 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg13!),
                          //14
                          if (widget.recipe.manual14 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual14!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg14 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg14!),
                          //15
                          if (widget.recipe.manual15 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual15!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg15 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg15!),
                          //16
                          if (widget.recipe.manual16 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual16!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg16 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg16!),
                          //17
                          if (widget.recipe.manual17 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual17!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg17 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg17!),
                          //18
                          if (widget.recipe.manual18 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual18!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg18 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg18!),
                          //19
                          if (widget.recipe.manual19 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual19!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg19 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg19!),
                          //20
                          if (widget.recipe.manual20 != '')
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(widget.recipe.manual20!,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          if (widget.recipe.manualimg20 != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.manualimg20!),
                          const SizedBox(height: 50),

                          Text(
                            '${widget.recipe.rcpnm} 완성!',
                            style: const TextStyle(fontSize: 30),
                          ),
                          if (widget.recipe.attfilenomain != '')
                            CachedNetworkImage(
                                imageUrl: widget.recipe.attfilenomain!),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: const Text("오늘은 이 메뉴로 확정!"),
                  onPressed: () {
                    final Box box = Hive.box<EatNote>('eatNoteBox');
                    box.add(EatNote(
                        recipe: widget.recipe, eatDateTime: DateTime.now()));
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
