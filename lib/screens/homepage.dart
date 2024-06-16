import 'package:flutter/material.dart';
import 'package:testapp/screens/screen_one.dart';
import 'package:testapp/screens/screen_three.dart';
import 'package:testapp/screens/screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width > 400
        ? 400
        : MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          height: 70,
          child: Center(
            child: Text(
              "Select a Screen",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 46,
                  width: width,
                  margin:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0,
                          0.52
                        ],
                        colors: [
                          Color(0xFFFAAA14),
                          Color(0xFFFFD78D),
                        ]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenOne()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "Screen One",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 46,
                  width: width,
                  margin:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0,
                          0.52
                        ],
                        colors: [
                          Color(0xff949EFF),
                          Color(0xffA8B1FF),
                        ]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenTwo()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "Screen Two",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 46,
                  width: width,
                  margin:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: const [0, 0.5, 1],
                      colors: [
                        const Color(0xffEE7D42),
                        const Color(0xffFFC8AB),
                        const Color(0xffEE7D42).withOpacity(.6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenThree()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "Screen Three",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  "Developed By Sudhir Paudel",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
