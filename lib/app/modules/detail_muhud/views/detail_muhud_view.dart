import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ishari/app/data/models/detail_muhud.dart' as details;
import 'package:ishari/app/data/models/muhud.dart';
import 'package:ishari/app/misc/colors.dart';
import 'package:ishari/app/routes/app_pages.dart';
import 'package:ishari/app/widgets/app_arabic_bold_text.dart';
import 'package:ishari/app/widgets/app_arabic_style.dart';
import 'package:ishari/app/widgets/app_arabic_text.dart';
import 'package:ishari/app/widgets/app_text.dart';

import '../controllers/detail_muhud_controller.dart';

class DetailMuhudView extends GetView<DetailMuhudController> {
  DetailMuhudView({Key? key}) : super(key: key);
  final Muhud muhud = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20, left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.HOME, arguments: context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // AppLargeText(
                      //   text: muhud.name?.transliteration?.id?.toUpperCase() ??
                      //       'Error',
                      //   size: 20,
                      //   color: AppColors.mainColor,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            AppArabicBoldText(
                              text: muhud.name?.short ?? 'Error',
                              size: 30,
                            ),
                            AppText(text: muhud.name?.translation?.id ?? 'Error'),
                            const SizedBox(
                              height: 20,
                            ),
                            const AppArabicStyle(
                              text: "أَللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ عَلَيْهِ ",
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder<details.DetailMuhud>(
                        future: controller.getDetailMuhud(muhud.name?.transliteration?.id ?? ''),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Text("Loading menuggu data.."),
                            );
                          }

                          return Container(
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data?.muhud?.length,
                                  itemBuilder: (context, index) {
                                    details.Muhud? baris = snapshot.data?.muhud?[index];
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                            width: double.maxFinite,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.bgGrey.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(image: AssetImage("assets/images/ayat.png"), fit: BoxFit.cover)),
                                                          child: Center(
                                                            child: Text(
                                                              "${index + 1}",
                                                              style: const TextStyle(
                                                                  fontSize: 10, color: AppColors.mainColor, fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                        ),
                                                        GetBuilder<DetailMuhudController>(
                                                          builder: (c) => Row(children: [
                                                            Container(
                                                              width: 150,
                                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                                              child: DropdownSearch<String>(
                                                                items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                                                                popupProps: const PopupProps.menu(
                                                                  showSelectedItems: true,
                                                                ),
                                                                dropdownDecoratorProps: const DropDownDecoratorProps(
                                                                    dropdownSearchDecoration: InputDecoration(enabled: true)),
                                                                onChanged: print,
                                                                selectedItem: "Brazil",
                                                              ),
                                                            ),
                                                            IconButton(
                                                                onPressed: () {},
                                                                icon: const Icon(
                                                                  Icons.bookmark_add_outlined,
                                                                  size: 20,
                                                                  color: AppColors.mainColor,
                                                                )),
                                                            // menampilkan dua button {pause, stop} ketika audio dijalankan
                                                            (baris?.kondisiAudio == "stop")
                                                                ? IconButton(
                                                                    onPressed: () {
                                                                      c.playAudio(baris!, "joss");
                                                                    },
                                                                    icon: const Icon(
                                                                      Icons.play_arrow,
                                                                      size: 20,
                                                                      color: AppColors.mainColor,
                                                                    ))
                                                                : Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      (baris?.kondisiAudio == "playing")
                                                                          ? IconButton(
                                                                              onPressed: () {
                                                                                c.pauseAudio(baris!);
                                                                              },
                                                                              icon: const Icon(
                                                                                Icons.pause,
                                                                                size: 20,
                                                                                color: AppColors.mainColor,
                                                                              ))
                                                                          : IconButton(
                                                                              onPressed: () {
                                                                                c.resumeAudio(baris!);
                                                                              },
                                                                              icon: const Icon(
                                                                                Icons.play_arrow,
                                                                                size: 20,
                                                                                color: AppColors.mainColor,
                                                                              )),
                                                                      IconButton(
                                                                          onPressed: () {
                                                                            c.stopAudio(baris!);
                                                                          },
                                                                          icon: const Icon(
                                                                            Icons.stop,
                                                                            size: 20,
                                                                            color: AppColors.mainColor,
                                                                          ))
                                                                    ],
                                                                  )
                                                          ]),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: double.maxFinite,
                                                  child: AppArabicText(
                                                    text: " ${baris!.text!.arab} ",
                                                    size: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: double.maxFinite,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 20),
                                                    child: Text(
                                                      "${baris.text?.transliteration}",
                                                      textAlign: TextAlign.start,
                                                      style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: double.maxFinite,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                                    child: Text(
                                                      "${baris.translation!.id}",
                                                      textAlign: TextAlign.justify,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          // fontWeight:
                                                          //     FontWeight.bold,
                                                          color: AppColors.mainColor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
