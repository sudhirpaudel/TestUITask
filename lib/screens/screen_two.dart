import 'package:flutter/material.dart';
import 'package:testapp/widgets/star_clipper_container.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width > 420
        ? 420
        : MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: const Color(0xffA8B1FF),
      ),
      body: Container(
        color: const Color(0xffA8B1FF),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xff949EFF),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "スタンプカード詳細",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                        child: Center(
                          child: Container(
                            height: 2,
                            width: 8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Mer キッチン",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "現在の獲得数",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                            Text(
                              "30",
                              style: TextStyle(
                                  fontSize: 28,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "個",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height - 182,
              width: screenWidth > 800 ? 800 : width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 260,
                            width: width,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: width,
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 30, top: 30),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.1),
                                        blurRadius: 20,
                                        spreadRadius: 0,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: GridView.builder(
                                    itemCount: 15,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                            mainAxisSpacing: 14,
                                            crossAxisSpacing: 14,
                                            mainAxisExtent: 42,
                                            childAspectRatio: 1),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 42,
                                        width: 42,
                                        child: Center(
                                          child: ClipPath(
                                            clipper: StarClipper(16),
                                            child: Container(
                                              height: 42,
                                              width: 42,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFAA677),
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.topRight,
                                                  stops: const [0, 1],
                                                  colors: [
                                                    const Color(0xffFAA677),
                                                    const Color(0xffFAA677)
                                                        .withOpacity(.5)
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(42),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 30, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${index + 1} / 2枚目",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff454545),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "スタンプ獲得履歴",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff454545)),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width:screenWidth > 800 ? width-20 : width,
                        height: height - 472,
                        child: ListView.builder(
                            itemCount: screenWidth > 800 ? 8 : 16,
                            itemBuilder: (BuildContext context, int index) {
                              return dateAndExtraBox(width);
                            }),
                      ),
                      screenWidth > 800
                          ? SizedBox(
                              width: screenWidth > 800 ? width-20 : width,
                              height: height - 472,
                              child: ListView.builder(
                                  itemCount: screenWidth > 800 ? 8 : 16,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return dateAndExtraBox(width);
                                  }),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dateAndExtraBox(double width) {
    return Column(
      children: [
        Container(
          height: 62,
          margin: const EdgeInsets.only(left: 22, right: 22, top: 20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2021 / 11 / 16",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffb5b5b5)),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "スタンプを獲得しました。",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff454545)),
                  ),
                  Text(
                    "1 個",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff454545)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: const Color(0xffe7e7e7),
        ),
      ],
    );
  }
}
