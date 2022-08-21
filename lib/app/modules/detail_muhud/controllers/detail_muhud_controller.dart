import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ishari/app/data/models/detail_muhud.dart';
import 'package:just_audio/just_audio.dart';

class DetailMuhudController extends GetxController {
  final player = AudioPlayer();
  Muhud? barisTerakhir;

  Future<DetailMuhud> getDetailMuhud(String name) async {
    final raw = await rootBundle.loadString("assets/muhud_detail.json");
    Map<String, dynamic> data = (json.decode(raw) as Map<String, dynamic>)["data"][name];
    // print(data);
    return DetailMuhud.fromJson(data);
  }

  void pauseAudio(Muhud baris) async {
    try {
      // merubah var kondisi menjadi playing
      await player.pause();
      baris.kondisiAudio = "pause";
      update();

      //
    } on PlayerException catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: "Connection aborted: ${e.message}");
    } catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: "audio tidak bisa diputar");
    }
  }

  void resumeAudio(Muhud baris) async {
    try {
      // merubah var kondisi menjadi playing
      baris.kondisiAudio = "playing";
      update();
      await player.play();
      baris.kondisiAudio = "stop";
      update();

      //
    } on PlayerException catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: "Connection aborted: ${e.message}");
    } catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: "audio tidak bisa diputar");
    }
  }

  void playAudio(Muhud baris, String t) async {
    print(t);
    if (baris.audio?.primary != null) {
      // Catching errors at load time
      try {
        // cek baris terakhir yang di play
        barisTerakhir ??= baris;

        barisTerakhir!.kondisiAudio = "stop";
        barisTerakhir = baris;
        barisTerakhir!.kondisiAudio = "stop";
        update();
        await player.stop();
        await player.setUrl(baris.audio!.primary!);

        // merubah var kondisi menjadi playing
        baris.kondisiAudio = "playing";
        update();
        await player.play();
        baris.kondisiAudio = "stop";
        await player.stop();
        update();
      } on PlayerException catch (e) {
        Get.defaultDialog(title: "terjadi kesalahan", middleText: e.message.toString());
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(title: "terjadi kesalahan", middleText: "Connection aborted: ${e.message}");
      } catch (e) {
        Get.defaultDialog(title: "terjadi kesalahan", middleText: "audio tidak bisa diputar");
      }
    } else {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: "audio tidak bisa diputar");
    }
  }

  void stopAudio(Muhud baris) async {
    try {
      // merubah var kondisi menjadi playing
      await player.stop();
      baris.kondisiAudio = "stop";
      update();

      //
    } on PlayerException catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: "Connection aborted: ${e.message}");
    } catch (e) {
      Get.defaultDialog(title: "terjadi kesalahan", middleText: "audio tidak bisa diputar");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    player.stop();
    player.dispose();
    super.onClose();
  }
}
