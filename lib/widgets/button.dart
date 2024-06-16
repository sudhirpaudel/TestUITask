import 'package:flutter/material.dart';

Widget button(double width,String text) {
  return  Container(
      height: 50,
      width: width > 500 ? 400 : width,
      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      )),
    
  );
}
