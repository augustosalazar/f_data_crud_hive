import 'package:f_data_crud/ui/controllers/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/my_app.dart';

void main() {
  Get.put(DataController());
  runApp(const MyApp());
}
