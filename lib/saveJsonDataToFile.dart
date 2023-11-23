import 'dart:convert';
import 'dart:io';
import 'package:dotenv/dotenv.dart';

import 'package:dio/dio.dart';

void main(){
  fetchData();
}

fetchData() async {
  var env = DotEnv(includePlatformEnvironment: true)..load();

  //total_count : 1114 , 2023-09-18 기준
  Response response = await Dio().get('http://openapi.foodsafetykorea.go.kr/api/${env['foodsafetykoreaKey']}/COOKRCP01/json/1/1000');
  Map<String,dynamic> source = response.data;

  Response response2 = await Dio().get('http://openapi.foodsafetykorea.go.kr/api/${env['foodsafetykoreaKey']}/COOKRCP01/json/1001/1114');
  source['COOKRCP01']['row'].addAll(response2.data['COOKRCP01']['row']);

  String string = json.encode(source);
  const filename = 'sourceFile';
  await File(filename).writeAsString(string);
}
