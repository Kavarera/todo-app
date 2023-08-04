import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/todoModel.dart';

import '../controllers/list_todo_controller.dart';

class AddTodoBottomSheet extends StatelessWidget {
  final textFieldC1 = TextEditingController();
  final textFieldC2 = TextEditingController();
  final ListTodoController listTodoController = Get.find();

  AddTodoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
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
              mainAxisSize: MainAxisSize.min,
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
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    listTodoController
                        .addItem(TodoModel(textFieldC1.text, textFieldC2.text));
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 15,
                      bottom: 10,
                    ),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
