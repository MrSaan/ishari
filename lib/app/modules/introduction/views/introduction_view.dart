import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ishari/app/misc/colors.dart';
import 'package:ishari/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sholawat Ishari',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Dimana saja dan kapan saja, cukup dalam genggaman Anda, ke-utamaan dan keberkahan shalawat senantiasa tercurahkan kepada Anda sekalian',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 300,
                height: 300,
                child: Lottie.asset("assets/lotties/animasi-started.json")),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.HOME),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.darkColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text(
                    "Mulai",
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
