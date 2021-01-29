// Copyright 2020 serim
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:ui';

import 'package:flutter/material.dart';

class UtilConst {
  // Settings
  static bool enableLog = false;

  // size
  static double height = 0.0;
  static double width = 0.0;

  // color
  final Color bgColor = Color.fromARGB(0xff, 0xe0, 0xe0, 0xe0);
  final Color pColor = Color.fromARGB(0xff, 0x3f, 0x59, 0x8c);
  final Color tpColor = Color.fromARGB(0xff, 0x29, 0x43, 0x77);

  //assets
  String icons(String file) {
    String releasePath = "./assets/";
    String path = "/icons/" + file;
    if (!enableLog) path = releasePath + path;
    return path;
  }

  String images(String file) {
    String releasePath = "./assets/";
    String path = "/images/" + file;
    if (!enableLog) path = releasePath + path;
    return path;
  }

  String font(String file) {
    String releasePath = "./assets/";
    String path = "/fonts/" + file;
    if (!enableLog) path = releasePath + path;
    return path;
  }

  void init(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  void log(String message) {
    if (enableLog) {
      print(message);
    }
  }
}
