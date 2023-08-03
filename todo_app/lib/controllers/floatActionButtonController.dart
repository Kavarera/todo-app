// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/model/todoModel.dart';

class floatActionButtonController extends GetxController {
  var itemList = <TodoModel>[].obs;
  final textFieldC1 = TextEditingController();
  final textFieldC2 = TextEditingController();
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      elevation: 15,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.blue,
              ),
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Add New Task",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: textFieldC1,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(labelText: 'Description'),
                    controller: textFieldC2,
                  ),
                  const SizedBox(
                    height: 105,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        itemList
                            .add(TodoModel(textFieldC1.text, textFieldC2.text));
                        textFieldC1.clear();
                        textFieldC2.clear();
                        saveItemListToStorage();
                        Navigator.pop(context);
                        Get.snackbar(
                            "Success", "Berhasil menambahkan task baru",
                            snackPosition: SnackPosition.TOP,
                            margin: const EdgeInsets.only(left: 10, right: 10));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveItemListToStorage() async {
    final box = GetStorage();
    await box.write(
        "listtodo",
        itemList.map((item) {
          return item.toJson();
        }).toList());
  }

  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init();
    final box = GetStorage();
    if (box.hasData("listtodo")) {
      final data = box.read<List<dynamic>>("listtodo");
      itemList.addAll(data!.map((json) => TodoModel.fromJson(json)));
    }
  }
}
