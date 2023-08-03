import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/list_todo_controller.dart';
import 'package:todo_app/controllers/floatActionButtonController.dart';
import 'package:todo_app/widget/itemListWidget.dart';

class ListTodoPage extends StatelessWidget {
  const ListTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listTodoController = Get.put(ListTodoController());
    final controllerFAB = Get.put(floatActionButtonController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controllerFAB.showBottomSheet(context),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_task),
      ),
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Todo App List ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "By Kavarera",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              tooltip: 'Delete all to-do',
              onPressed: () {},
              icon: const Icon(
                Icons.cleaning_services_rounded,
                color: Colors.redAccent,
              ))
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Obx(
            () => ListView.builder(
              itemCount: listTodoController.listTodo.length,
              itemBuilder: (_, index) {
                return Itemlist(model: listTodoController.listTodo[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
