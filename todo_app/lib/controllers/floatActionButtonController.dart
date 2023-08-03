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
      elevation: 5,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 55),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      .add(new TodoModel(textFieldC1.text, textFieldC2.text));
                  textFieldC1.clear();
                  textFieldC2.clear();
                  saveItemListToStorage();
                  Navigator.pop(context);
                  Get.snackbar("Success", "Berhasil menambahkan task baru",
                      snackPosition: SnackPosition.TOP,
                      margin: const EdgeInsets.only(left: 10, right: 10));
                },
                child: const Text('Add another Task'))
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
          print("DATA ITEM TO JSON \n ${item.toJson()}\n\n");
          return item.toJson();
        }).toList());
    print("isi box setelah add");
    print(box.read("listtodo"));
  }

  @override
  void onInit() async {
    print("CLASS FAB DI INISIALISASI");
    super.onInit();
    await GetStorage.init();
    final box = GetStorage();
    if (box.hasData("listtodo")) {
      final data = box.read<List<dynamic>>("listtodo");
      print("Class Data = ${data}");
      itemList.addAll(data!.map((json) => TodoModel.fromJson(json)));
    }
    print("data box = \n ${box.read("listtodo")}\n\n");
  }
}
