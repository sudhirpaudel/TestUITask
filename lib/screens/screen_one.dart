import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/state_management/part_time_job_controller.dart';
import 'package:testapp/widgets/bottom_nav_bar.dart';
import 'dart:math';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final jobsController = Get.put(PartTimeJobController());

  List weekdays = ["日" ,"月", "火", "水", "木", "金", "土"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width > 400
        ? 400
        : MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.52],
                colors: [Colors.white, Color(0xFFF3F4F6)],
              ),
            ),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 70,
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 70,
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(),
                              Container(
                                height: 40,
                                width: width * 0.6,
                                padding: const EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFf7f7f7),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 8),
                                      border: InputBorder.none,
                                      hintText: 'Search city',
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                        color: const Color(0xff303030)
                                            .withOpacity(.35),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 34,
                                width: 34,
                                child: Transform.rotate(
                                  angle: 270 * pi / 180,
                                  child: const Icon(
                                    Icons.tune_rounded,
                                    size: 34,
                                    color: Color(0xFFb7b7b7),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 34,
                                width: 34,
                                child: Icon(
                                  Icons.favorite_outline_rounded,
                                  size: 34,
                                  color: Color(0xFFEE5F40),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth > 450 ? 30 : 4,
                        child: SizedBox(
                          height: 70,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                padding: const EdgeInsets.only(left: 6),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff8C817B).withOpacity(.1),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 18,
                                    color: Color(0xff9C9896),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 34,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0, 0.52],
                        colors: [Color(0xFFFAAA14), Color(0xFFFFD78D)]),
                  ),
                  child: Center(
                    child: Text(
                      "${DateTime.now().year}年 ${DateTime.now().month}月 ${DateTime.now().day}日（${weekdays[(DateTime.now().weekday)%7]}）",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 56,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return date(
                        weekdays[(DateTime.now().weekday + index) % 7],
                        DateTime.now().day + index,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height - 240,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: screenWidth,
                        child: Center(
                          child: SizedBox(
                            width: screenWidth > 800 ? 800 : width,
                            height: height - 220,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            screenWidth > 800 ? 2 : 1,
                                        childAspectRatio: width / 388,
                                        mainAxisSpacing: 0),
                                itemCount: jobsController.partTimeJobs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 388,
                                    width: width,
                                    margin: const EdgeInsets.only(
                                      left: 26,
                                      right: 26,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 186,
                                          width: width,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 186,
                                                width: width,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFFAAA14),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                  child: Image.asset(
                                                    jobsController
                                                        .partTimeJobs[index]
                                                        .imageUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                child: Container(
                                                    height: 20,
                                                    width: 74,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFF6262),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.5),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "本日まで",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 186,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 186,
                                                width: width,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 16),
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      jobsController
                                                          .partTimeJobs[index]
                                                          .jobName,
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff303030),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 25,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 25,
                                                            width: 130,
                                                            decoration: BoxDecoration(
                                                                color: const Color(
                                                                        0xffEEAB40)
                                                                    .withOpacity(
                                                                        0.1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3)),
                                                            child: Center(
                                                              child: Text(
                                                                jobsController
                                                                    .partTimeJobs[
                                                                        index]
                                                                    .company,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xffFAAA14)),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            jobsController
                                                                .partTimeJobs[
                                                                    index]
                                                                .salary,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff303030),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      jobsController
                                                          .partTimeJobs[index]
                                                          .date,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff303030),
                                                      ),
                                                    ),
                                                    Text(
                                                      jobsController
                                                          .partTimeJobs[index]
                                                          .address,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff303030),
                                                      ),
                                                    ),
                                                    Text(
                                                      jobsController
                                                          .partTimeJobs[index]
                                                          .transfortFee,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff303030),
                                                      ),
                                                    ),
                                                    Text(
                                                      jobsController
                                                          .partTimeJobs[index]
                                                          .companyName,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: const Color(
                                                                0xff303030)
                                                            .withOpacity(.35),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 20,
                                                right: 20,
                                                child: InkWell(
                                                  onTap: () {
                                                    jobsController
                                                        .updateJobFavourite(index);
                                                  },
                                                  child: Obx(
                                                    () => SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child: jobsController
                                                              .jobFavourite[
                                                                  index]
                                                              
                                                          ? const Icon(
                                                              Icons.favorite,
                                                              size: 30,
                                                              color: Color(
                                                                  0xFFEE5F40),
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .favorite_outline_rounded,
                                                              size: 30,
                                                              color: const Color(
                                                                      0xFF303030)
                                                                  .withOpacity(
                                                                      0.2),
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            right: screenWidth > 450 ? 30 : 10,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                  child: Icon(
                Icons.location_on_outlined,
                color: Color(0xff303030),
                size: 28,
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: myBottomNavBar(screenWidth),
          )
        ],
      ),
    );
  }

  Widget date(String weekday, int day) {
    if (day > 30) {
      day = day - 30;
    }
    return Padding(
      padding: EdgeInsets.only(left: day == DateTime.now().day ? 30 : 10),
      child: Container(
        height: 66,
        width: 44,
        decoration: BoxDecoration(
          color: day == DateTime.now().day ? const Color(0xFFFAAA14) : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              weekday,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$day",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
