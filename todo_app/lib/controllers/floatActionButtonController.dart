// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/todoModel.dart';
import 'package:todo_app/widget/add_todo_bottomsheet_widget.dart';

import 'list_todo_controller.dart';

class floatActionButtonController extends GetxController {
  var itemList = <TodoModel>[].obs;
  final ListTodoController listTodoController = Get.find();

  final textFieldC1 = TextEditingController();
  final textFieldC2 = TextEditingController();

  void addItem(TodoModel item) {
    listTodoController.addItem(item);
    textFieldC1.clear();
    textFieldC2.clear();
    Get.snackbar("Success", "Berhasil menambahkan task baru",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(left: 10, right: 10));
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddTodoBottomSheet(),
      isScrollControlled: true,
    );
    // Get.bottomSheet(
    //   AddTodoBottomSheet(),
    //   isScrollControlled: true,
    //   backgroundColor: Colors.white,
    //   elevation: 1,
    // );
  }
}
