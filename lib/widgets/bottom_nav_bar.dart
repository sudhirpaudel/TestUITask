import 'package:flutter/material.dart';

Widget myBottomNavBar(double width) {
  return SizedBox(
    width: width,
    height: 86,
    child: Stack(
      children: [
        Positioned(
          top: 10,
          child: Container(
            color: Colors.white,
            height: 76,
            width: width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 46,
                  child: Column(
                    children: [
                      Icon(
                        Icons.search,
                        size: 28,
                      ),
                      Text(
                        'さがす',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff303030),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 46,
                  child: Column(
                    children: [
                      Icon(
                        Icons.business_center_outlined,
                        size: 28,
                      ),
                      Text(
                        'お仕事',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff303030),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 46,
                  width: 28,
                ),
                SizedBox(
                  height: 46,
                  child: Column(
                    children: [
                      Icon(
                        Icons.chat_outlined,
                        size: 28,
                      ),
                      Text(
                        'チャット',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff303030),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 46,
                  child: Column(
                    children: [
                      Icon(
                        Icons.person_outlined,
                        size: 28,
                      ),
                      Text(
                        'マイページ',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff303030),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: SizedBox(
            width: width,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.topRight,
                          stops: [0, .8],
                          colors: [Color(0xFFFAAA14), Color(0xFFFFD78D),],),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.crop_free_rounded,
                      color: Colors.white,
                      size: 36,
                    )),
                  ),
                  const SizedBox(
                    height: 18,
                    child: Center(
                      child: Text(
                        '打刻する',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff303030),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
