import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ishari/app/data/models/muhud.dart';
import 'package:ishari/app/misc/colors.dart';
import 'package:ishari/app/routes/app_pages.dart';
import 'package:ishari/app/widgets/app_arabic_bold_text.dart';
import 'package:ishari/app/widgets/app_large_text.dart';
import 'package:ishari/app/widgets/app_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          AppLargeText(
                            text: "ISHARI",
                            size: 25,
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: const AppLargeText(
                  text: "Assalamu'alaikum",
                  size: 16,
                  color: AppColors.secondaryColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: const AppLargeText(
                  text: "Al Gazhali",
                  size: 35,
                  color: AppColors.darkColor,
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 130,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                      AppColors.gradientA,
                      AppColors.gradientB,
                    ])),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LAST_READ, arguments: "tes");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      margin: const EdgeInsets.only(right: 10),
                                      child: Image.asset('assets/images/last-read.png'),
                                    ),
                                    const AppLargeText(
                                      text: "Terakhir Baca",
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const AppLargeText(
                                text: "Wulidal Habib",
                                color: Colors.white,
                                size: 25,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const AppText(
                                text: "muhud ke-1",
                                size: 12,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
                          child: Image.asset('assets/images/quran.png'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 80),
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 10),
                      labelColor: AppColors.darkColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                      tabs: const [
                        AppLargeText(
                          text: "Muhud",
                          size: 14,
                        ),
                        AppLargeText(
                          text: "Diwan Hadrah",
                          size: 14,
                        ),
                        AppLargeText(
                          text: "Syaroful Anam",
                          size: 14,
                        ),
                      ]),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Expanded(
                child: TabBarView(children: [
                  FutureBuilder<List<Muhud>>(
                      future: controller.getAllMuhud(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Tidak ada data.."),
                          );
                        }
                        return Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Muhud muhud = snapshot.data![index];
                                return Container(
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      border: index == 0
                                          ? const Border(top: BorderSide.none)
                                          : const Border(top: BorderSide(width: 0.5, color: Colors.grey))),
                                  child: ListTile(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_MUHUD, arguments: muhud);
                                    },
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration:
                                          const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/ayat.png"), fit: BoxFit.cover)),
                                      child: Center(
                                          child: Text(
                                        "${muhud.number}",
                                        style: const TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    title: Text(
                                      muhud.name!.transliteration!.id ?? 'Muhud ...',
                                    ),
                                    subtitle: Text("${muhud.numberOfVerses ?? 'Error'} bait shalawat"),
                                    trailing: AppArabicBoldText(
                                      text: "${muhud.name!.short ?? 'Error'} ",
                                      size: 25,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                  const Text("Muhud"),
                  const Text("Muhud"),
                ]),
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2, configuration.size!.height - radius / 2);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
