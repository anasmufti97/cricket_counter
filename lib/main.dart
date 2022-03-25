import 'package:cricket_counter/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const GetMaterialApp(
debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));

}