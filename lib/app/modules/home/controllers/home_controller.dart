import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ishari/app/data/models/muhud.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  Future<List<Muhud>> getAllMuhud() async {
    final raw = await rootBundle.loadString("assets/muhud.json");
    List data = (json.decode(raw) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Muhud.fromJson(e)).toList();
    }
  }
}
