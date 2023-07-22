import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../widget/itemListWidget.dart';

class floatActionButtonController extends GetxController {
  var itemList = <Itemlist>[].obs;
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
                  itemList.add(Itemlist(
                      itemTitle: textFieldC1.text,
                      description: textFieldC2.text));
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

  void saveItemListToStorage() {
    final box = GetStorage();
    box.write("listtodo", itemList.map((item) => item.toJson()).toList());
  }

  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init();
    final box = GetStorage();
    if (box.hasData("listtodo")) {
      final data = box.read<List<dynamic>>("listtodo");
      print("on init");
      print(data);
      itemList.addAll(data!.map((json) => Itemlist.fromJson(json)));
    }
  }
}
