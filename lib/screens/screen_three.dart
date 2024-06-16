import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testapp/state_management/form_fields_controller.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  final FormFieldsController formFieldsController =
      Get.put(FormFieldsController());
  final PickImageController pickImageController =
      Get.put(PickImageController());
  List<String?> selectedRange = [null, null, null, null];
  List<TextEditingController> controllres =
      List.generate(10, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width > 400
        ? 400
        : MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.only(left: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xff8C817B).withOpacity(.1),
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
                  const Text(
                    "スタンプカード詳細",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4B4948),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: Stack(
                      children: [
                        const SizedBox(
                          height: 32,
                          width: 32,
                          child: Center(
                              child: Icon(Icons.notifications_none_outlined,
                                  size: 32, color: Color(0xff4B4948))),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: const Color(0xffEE7D42),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Text(
                                "99+",
                                style: TextStyle(
                                    fontSize: 7,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: screenWidth,
              color: const Color(0xff8C817B).withOpacity(.1),
            ),
            SizedBox(
              width: screenWidth > 800 ? 800 : width,
              height: height - 200,
              child: ListView(
                children: [
                  SizedBox(
                    height: screenWidth > 800 ? 160 : 320,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: screenWidth > 800 ? 2 : 1,
                      childAspectRatio: width / 80,
                      children: [
                        textBox(width, "店舗名*", "Mer キッチン", controllres[0]),
                        textBox(width, "代表担当者名*", "林田絵梨花", controllres[1]),
                        textBox(width, "店舗電話番号*", "123 - 4567 8910",
                            controllres[2]),
                        textBox(
                            width, "店舗住所*", "大分県豊後高田市払田791-13", controllres[3]),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: 220,
                    width: width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/map.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth > 800 ? 252 : 504,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: screenWidth > 800 ? 2 : 1,
                      childAspectRatio: width / 126,
                      children: [
                        addPicBoxes(
                            width, "店舗外観*", "  (最大3枚まで)", "写真を追加", true, 0),
                        addPicBoxes(width, "店舗内観*", "  (1枚〜3枚ずつ追加してください)",
                            "写真を追加", true, 1),
                        addPicBoxes(width, "料理写真*", "  (1枚〜3枚ずつ追加してください,)",
                            "写真を追加", true, 2),
                        addPicBoxes(width, "メニュー写真*", "  (1枚〜3枚ずつ追加してください)",
                            "写真を追加", true, 3),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenWidth > 800 ? 80 : 160,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: screenWidth > 800 ? 2 : 1,
                      childAspectRatio: width / 80,
                      children: [
                        selectRange(width, "営業時間*", 0),
                        selectRange(width, "ランチ時間*", 1),
                      ],
                    ),
                  ),
                  clickBox(
                      "定休日*",
                      screenWidth > 800
                          ? [
                              [
                                ["月", formFieldsController.isSelected[0], 0],
                                ["火", formFieldsController.isSelected[1], 1],
                                ["水", formFieldsController.isSelected[2], 2],
                                ["木", formFieldsController.isSelected[3], 3],
                                ["金", formFieldsController.isSelected[4], 4],
                                ["土", formFieldsController.isSelected[5], 5],
                                ["日", formFieldsController.isSelected[6], 6],
                                ["祝", formFieldsController.isSelected[7], 7]
                              ]
                            ]
                          : [
                              [
                                ["月", formFieldsController.isSelected[0], 0],
                                ["火", formFieldsController.isSelected[1], 1],
                                ["水", formFieldsController.isSelected[2], 2],
                                ["木", formFieldsController.isSelected[3], 3],
                              ],
                              [
                                ["金", formFieldsController.isSelected[4], 4],
                                ["土", formFieldsController.isSelected[5], 5],
                                ["日", formFieldsController.isSelected[6], 6],
                                ["祝", formFieldsController.isSelected[7], 7]
                              ]
                            ]),
                  SizedBox(
                    height: screenWidth > 800 ? 160 : 320,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: screenWidth > 800 ? 2 : 1,
                      childAspectRatio: width / 80,
                      children: [
                        textBox(width, "料理カテゴリー*", "料理カテゴリー選択", controllres[4]),
                        inputRange(width, "予算*", "¥ 1,000", "¥ 2,000",
                            controllres[5], controllres[6]),
                        textBox(width, "キャッチコピー*", "美味しい！リーズナブルなオムライスランチ！",
                            controllres[7]),
                        textBox(width, "座席数*", "40席", controllres[8]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenWidth > 800 ? 64 : 192,
                    child: screenWidth > 800
                        ? Row(
                            children: [
                              clickBox("喫煙席*", [
                                [
                                  ["有", formFieldsController.isSelected[8], 8],
                                  ["無", formFieldsController.isSelected[9], 9]
                                ]
                              ]),
                              clickBox("駐車場*", [
                                [
                                  [
                                    "有",
                                    formFieldsController.isSelected[10],
                                    10
                                  ],
                                  ["無", formFieldsController.isSelected[11], 11]
                                ]
                              ]),
                              clickBox("来店プレゼント*", [
                                [
                                  [
                                    "有（最大３枚まで）",
                                    formFieldsController.isSelected[12],
                                    12
                                  ],
                                  ["無", formFieldsController.isSelected[13], 13]
                                ]
                              ]),
                            ],
                          )
                        : Column(
                            children: [
                              clickBox("喫煙席*", [
                                [
                                  ["有", formFieldsController.isSelected[8], 8],
                                  ["無", formFieldsController.isSelected[9], 9]
                                ]
                              ]),
                              clickBox("駐車場*", [
                                [
                                  [
                                    "有",
                                    formFieldsController.isSelected[10],
                                    10
                                  ],
                                  ["無", formFieldsController.isSelected[11], 11]
                                ]
                              ]),
                              clickBox("来店プレゼント*", [
                                [
                                  [
                                    "有（最大３枚まで）",
                                    formFieldsController.isSelected[12],
                                    12
                                  ],
                                  ["無", formFieldsController.isSelected[13], 13]
                                ]
                              ]),
                            ],
                          ),
                  ),
                  addPicBoxes(width, "", "", "写真を追加", false, 4),
                  textBox(width, "来店プレゼント名*", "いちごクリームアイスクリーム, ジュース",
                      controllres[9]),
                ],
              ),
            ),
            Container(
              height: 46,
              width: width,
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [0, 1],
                  colors: [
                    const Color(0xffEE7D42).withOpacity(.7),
                    const Color(0xffFFC8AB).withOpacity(.5)
                  ],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  "編集を保存",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textBox(double width, String label, String hintText,
      TextEditingController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 3),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff4B4948),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
          height: 40,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: const Color(0xffE8E8E8),
            ),
          ),
          child: Center(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 8, left: 10),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xff303030).withOpacity(.35),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addPicBoxes(double width, String label, String smallLabel,
      String bgPic, bool showLabel, int index) {
    return Container(
      padding: const EdgeInsets.only(top: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showLabel
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 6),
                  child: Row(
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4B4948),
                        ),
                      ),
                      Text(
                        smallLabel,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9C9896),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                for (var i = 0; i < 3; i++)
                  Row(
                    children: [
                      Obx(
                        () => pickImageController
                                .imagePath[index * 3 + i].isNotEmpty
                            ? SizedBox(
                                height: 90,
                                width: 90,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          File(
                                            pickImageController
                                                .imagePath[index * 3 + i]
                                                .toString(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: InkWell(
                                        onTap: () {
                                          pickImageController
                                              .clearImage(index * 3 + i);
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  _selectImageFrom(context, index * 3 + i);
                                  // pickImageController.pickImage();
                                },
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(5),
                                    color: const Color(0xff9C9896),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        height: 86,
                                        width: 86,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.image_outlined,
                                              size: 32,
                                              color: Color(0xff9C9896),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              bgPic,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff9C9896),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clickBox(String label, List<List> listOfItems) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff4B4948),
            ),
          ),
        ),
        Column(
          children: [
            for (var items in listOfItems)
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var item in items) tickBox(item[0], item[1], item[2])
                  ],
                ),
              )
          ],
        ),
      ],
    );
  }

  Widget tickBox(String label, bool isSelected, int index) {
    return Container(
      padding: const EdgeInsets.only(right: 24),
      height: 24,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                formFieldsController.updateSelected(index);
              });
            },
            child: Obx(
              () => Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xffEE7D42) : null,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    width: 2,
                    color: formFieldsController.isSelected[index]
                        ? const Color(0xffEE7D42)
                        : const Color(0xffE8E8E8),
                  ),
                ),
                child: formFieldsController.isSelected[index]
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff4B4948),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputRange(
      double width,
      String label,
      String hintText1,
      String hintText2,
      TextEditingController controller1,
      TextEditingController controller2) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 4),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff4B4948),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                height: 40,
                width: width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffE8E8E8),
                  ),
                ),
                child: Center(
                  child: TextField(
                    controller: controller1,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 8, left: 10),
                      border: InputBorder.none,
                      hintText: hintText1,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff303030).withOpacity(.35),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: Text(
                    "~",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4B4948),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffE8E8E8),
                  ),
                ),
                child: Center(
                  child: TextField(
                    controller: controller2,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 8, left: 10),
                      border: InputBorder.none,
                      hintText: hintText1,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff303030).withOpacity(.35),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget selectRange(double width, String label, int index) {
    List<String> timing = ["10:30", "11:30", "12:30", "13:30", "14:30"];
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 9, bottom: 10),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff4B4948),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                height: 40,
                width: width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffE8E8E8),
                  ),
                ),
                child: Obx(
                  () => Center(
                    child: DropdownButton(
                      underline: const SizedBox(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Color(0xffE8E8E8),
                      ),
                      hint: const Text('時間'),
                      value: formFieldsController.selectedRange[index * 2 + 0],
                      onChanged: (newValue) {
                        formFieldsController.updateSelectedRange(
                            index * 2 + 0, newValue.toString());
                      },
                      items: timing.map((String time) {
                        return DropdownMenuItem<String>(
                          value: time,
                          child: Text(time),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: Text(
                    "~",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4B4948),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                height: 40,
                width: width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffE8E8E8),
                  ),
                ),
                child: Obx(
                  () => Center(
                    child: DropdownButton(
                      underline: const SizedBox(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Color(0xffE8E8E8),
                      ),
                      hint: const Text('時間'),
                      value: formFieldsController.selectedRange[index * 2 + 1],
                      onChanged: (newValue) {
                        formFieldsController.updateSelectedRange(
                           index * 2 + 1, newValue.toString());
                      },
                      items: timing.map((String time) {
                        return DropdownMenuItem<String>(
                          value: time,
                          child: Text(time),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _selectImageFrom(BuildContext context, int index) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          backgroundColor: const Color(0xffEE7D42),
          title: const Center(
            child: Text(
              "写真の追加元",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.camera_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'カメラ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () async {
                pickImageController.pickImage(index, ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.image_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'ギャラリー',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () async {
                pickImageController.pickImage(index, ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'キャンセル',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
