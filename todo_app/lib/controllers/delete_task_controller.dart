import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/controllers/floatActionButtonController.dart';

class DeleteTaskController extends GetxController {
  final box = GetStorage();

  void deleteTask() {
    debugPrint("\n\nDATA\n${box.read("listtodo")}\n\n");
  }
}
