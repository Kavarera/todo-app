import 'package:get/get.dart';
import 'package:todo_app/controllers/list_todo_controller.dart';
import 'package:todo_app/model/todoModel.dart';

class DeleteTaskController extends GetxController {
  final ListTodoController listTodoController = Get.find();
  void deleteTask(TodoModel item) {
    listTodoController.removeItem(item);
  }
}
